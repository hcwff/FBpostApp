class User
  include Mongoid::Document
  field :id
  field :provider
  field :uid
  field :name
  field :oauth_token
  field :oauth_expires_at, type: DateTime

  


  has_many :post
  #Mongoid.raise_not_found_error = false

  # def count
  #   u = User.where(id="51edc3054f0d0cd4ef000002")
  #   if u != nil
  #     puts "something's wrong"
  #   else
  #     return User.size();
  #   end
  # end

  def self.from_omniauth(auth)
    u = self.where(provider: auth.provider, uid: auth.uid).first
    if u.nil? # doesnt exist
      u = User.new
      u.provider = auth.provider
      u.uid = auth.uid
      u.name = auth.info.name
      u.image = auth.info.image
      u.oauth_token = auth.credentials.token
      u.oauth_expires_at = Time.at(auth.credentials.expires_at)
      u.save!
      return u
    else # does exist
      return u
    end
  end

  def facebook
    @facebook ||= Koala::Facebook::API.new(oauth_token)
    block_given? ? yield(@facebook) : @facebook
  rescue Koala::Facebook::APIError => e
    logger.info e.to_s
    nil
  end
    
  
end