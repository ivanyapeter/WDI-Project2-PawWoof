class Breed < ActiveRecord::Base
  has_many :breed_types
  has_many :dogs, :through => :breed_types
end