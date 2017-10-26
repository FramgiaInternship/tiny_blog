class Api::V1::BaseController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include EntriesHelper
  include UsersHelper
end
