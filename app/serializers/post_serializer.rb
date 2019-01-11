# Posts serializer
class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :slug
  belongs_to :user
  belongs_to :account
  has_many   :comments
  has_many   :tags
end
