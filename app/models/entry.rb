class Entry < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :title,   presence: true, length: {maximum: 256}
  validates :content, presence: true, length: {maximum: 2048}
  has_many :comments, dependent: :destroy
end
