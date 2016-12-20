class Tag < ApplicationRecord
  validates_presence_of :name
  # belongs_to :user
  has_many :tag_collections
  has_many :collections, through: :tag_collections
end
