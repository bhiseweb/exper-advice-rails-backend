# Post model
class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  validates :title, presence: true

  belongs_to :user
  belongs_to :account
  has_many   :comments, dependent: :destroy
  has_many   :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
end
