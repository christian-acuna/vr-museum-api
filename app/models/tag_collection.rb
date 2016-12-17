class TagCollection < ApplicationRecord
  belongs_to :tag
  belongs_to :collection
end
