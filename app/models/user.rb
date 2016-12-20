class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :validatable

  after_create :update_access_token!

  validates :username, presence: true
  validates_uniqueness_of :username
  validates :email, presence: true

  has_many :collections
  has_many :likes
  has_many :favorites
  has_many :tags

  private

  def update_access_token!
    self.access_token = "#{self.id}:#{Devise.friendly_token}"
    save
  end


end
