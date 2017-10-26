class CommentSerializer < ActiveModel::Serializer
  include ActionView::Helpers::DateHelper

  attributes :id, :entry_id, :body, :created_at, :owner

  def created_at
    time_ago_in_words object.created_at
  end

  def owner
    UserSerializer.new object.user
  end
end
