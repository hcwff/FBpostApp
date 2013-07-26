class Image
  include Mongoid::Document
  attr_accessible :image, :image_url
  field :image_url
  field :image
  belongs_to :user

  mount_uploader :image_url, ImageUploader
end
