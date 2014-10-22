require 'test_helper'

class EbayPagesControllerTest < ActionController::TestCase
  test "should get get" do
    get :get
    assert_response :success
  end

  test "should get home" do
    get :home
    assert_response :success
  end

end
