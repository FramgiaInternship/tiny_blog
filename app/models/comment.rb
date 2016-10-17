class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :entry

  validates :body, presence: true, length: {maximum: 1024}
end
