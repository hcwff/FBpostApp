class Post
  include Mongoid::Document
  field :comment
  belongs_to :user
  
end
