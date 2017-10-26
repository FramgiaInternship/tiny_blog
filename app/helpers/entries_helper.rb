module EntriesHelper
  def feed
    per_page = Settings.ENTRIES_PER_PAGE
    if logged_in?
      following_ids = "SELECT followed_id FROM relationships
        WHERE  follower_id = :user_id"

      @entries = Entry.includes(:user).where("user_id IN (#{following_ids})
        OR user_id = :user_id", user_id: current_user.id)

      @entries = @entries.order('created_at DESC')
        .paginate page: params[:page], per_page: per_page
    else
      @entries = Entry.includes(:user).order('created_at DESC').all
        .paginate page: params[:page], per_page: per_page
    end
  end

=begin
  def feed
    per_page = Settings.ENTRIES_PER_PAGE
    if logged_in?
      @entries = Entry.following current_user.following
      @entries = @entries.order('created_at DESC')
      .paginate(page: params[:page], per_page: per_page)
    else
      @entries = Entry.order('created_at DESC').all
      .paginate(page: params[:page], per_page: per_page)
    end
  end
=end
end
