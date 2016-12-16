class Collection < ApplicationRecord
  has_many :collection_art_objects
  has_many :art_objects, through: :collection_art_objects

  validates_presence_of :primary_object_id, :title
end
