class EntrySerializer < ActiveModel::Serializer
  include ActionView::Helpers::DateHelper

  attributes :id, :title, :content, :created_at, :updated_at, :owner

  has_many :comments, if: :show?

  def owner
    UserSerializer.new object.user
  end

  def created_at
    time = object.created_at
    case @instance_options[:action]
    when :index
      user = object.user.try :name
      I18n.t "entries.index.time_stamp", time: time_ago_in_words(time), user: user
    when :show
      time.strftime Settings.DATE_TIME_FORMAT
    else
      time
    end
  end

  def show?
    @instance_options[:action] == :show
  end
end
