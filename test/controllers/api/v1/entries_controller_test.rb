require 'test_helper'

class Api::V1::EntriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_entries_index_url
    assert_response :success
  end

end
