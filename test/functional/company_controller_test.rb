require 'test_helper'

class CompanyControllerTest < ActionController::TestCase
  test "should get table" do
    get :table
    assert_response :success
  end

  test "should get graph" do
    get :graph
    assert_response :success
  end

end
