module UsersHelper
  # Returns the Gravatar for the given user.
  def gravatar_for user, options = {size: Settings.AVATAR_DEFAULT}
    gravatar_id = Digest::MD5::hexdigest user.email.downcase
    size = options[:size]
    url = "#{Settings.GRAVATAR_PATH}#{gravatar_id}?s=#{size}"
    image_tag url, alt: user.name, class: "gravatar"
  end

  # Returns true if current user is admin.
  def admin?
    current_user.nil? ? false : current_user.admin?
  end

  # Returns all users.
  def get_users
    User.all.paginate page: params[:page], per_page: Settings.USERS_PER_PAGE
  end
end
