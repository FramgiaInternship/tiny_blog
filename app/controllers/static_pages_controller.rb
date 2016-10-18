class StaticPagesController < ApplicationController
  def home
    @feed_items = feed
    @entry = Entry.new
    @btn_submit = t "entries.create.btn_submit"
  end

  def help
  end
end
