class Collection < ApplicationRecord
  has_many :collection_art_objects
  has_many :art_objects, through: :collection_art_objects
  belongs_to :user
  belongs_to :primary_object, foreign_key: "primary_object_id", class_name: 'ArtObject'

  validates_presence_of :primary_object_id, :title
end
