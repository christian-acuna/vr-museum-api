class CollectionArtObject < ApplicationRecord
  belongs_to :collection
  belongs_to :art_object
end
