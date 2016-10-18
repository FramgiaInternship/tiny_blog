module UsersHelper
  # Returns the Gravatar for the given user.
  def gravatar_for user, options = {size: Settings.AVATAR_DEFAULT}
    gravatar_id = Digest::MD5::hexdigest user.email.downcase
    size = options[:size]
    url = "#{Settings.GRAVATAR_PATH}#{gravatar_id}?s=#{size}"
    image_tag url, alt: user.name, class: "gravatar"
  end
end
