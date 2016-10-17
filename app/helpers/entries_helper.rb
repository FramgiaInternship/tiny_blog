module EntriesHelper
  def feed
    per_page = 20
    @entries = Entry.order('created_at DESC').all.paginate(:page => params[:page], :per_page => per_page)

    # if logged_in?
    #
    # else
    #   per_page = 20
    #   @entries = Entry.all.paginate(:page => params[:page], :per_page => per_page)
    # end
  end
end
