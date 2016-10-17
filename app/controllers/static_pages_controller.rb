class StaticPagesController < ApplicationController
  def home
    @feed_items = feed
    @entry = Entry.new
  end

  def help
  end
end
