class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :entry

  validates :body, presence: true, length: {maximum: 1024}

  # class << self
  #   # Get all comments of given post.
  #   def get_comments entry_id
  #     Comment.where(entry_id: entry_id).order("created_at DESC")
  #   end
  # end
end
