class ArtObjectTag < ApplicationRecord
  belongs_to :tag
  belongs_to :art_object
end
