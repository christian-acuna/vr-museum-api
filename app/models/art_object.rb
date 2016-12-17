class ArtObject < ActiveRecord::Base
  has_many :collection_art_objects
  has_many :collections, through: :collection_art_objects
  validates_presence_of :title, :image_url, :thumbnail_url
  belongs_to :museum
  belongs_to :medium
end
