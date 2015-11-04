require 'carrierwave'
require 'carrierwave/orm/activerecord'

class ImageUploader < CarrierWave::Uploader::Base
  storage :file
end

class Dog < ActiveRecord::Base
  belongs_to :user
  has_many :breed_types
  has_many :breeds, :through => :breed_types
  mount_uploader :dog_img, ImageUploader
end