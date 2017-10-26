class Api::V1::EntriesController < Api::V1::BaseController
  def index
    render json: {data: ActiveModel::Serializer::ArraySerializer.new(feed, action: :index)}, status: 200
  end

  def show
    entry = Entry.includes(comments: :user).find_by id: params[:id]
    if entry
      render json: {data: EntrySerializer.new(entry, action: :show)}, status: 200
    else
      render json: {errors: "not found"}, status: 404
    end
  end
end
