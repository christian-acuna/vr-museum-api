class Museum < ApplicationRecord
  validates_presence_of :name, :location, :url
  has_many :art_objects

end
