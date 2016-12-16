class ArtObject < ActiveRecord::Base
  validates_presence_of :title, :image_url, :thumbnail_url
  belongs_to :museum
  belongs_to :medium
end
