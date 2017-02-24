require 'test_helper'

class ExpertApplicationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @expert_application = expert_applications(:one)
  end

  test "should get index" do
    get expert_applications_url
    assert_response :success
  end

  test "should get new" do
    get new_expert_application_url
    assert_response :success
  end

  test "should create expert_application" do
    assert_difference('ExpertApplication.count') do
      post expert_applications_url, params: { expert_application: { license_no: @expert_application.license_no, user_id: @expert_application.user_id } }
    end

    assert_redirected_to expert_application_url(ExpertApplication.last)
  end

  test "should show expert_application" do
    get expert_application_url(@expert_application)
    assert_response :success
  end

  test "should get edit" do
    get edit_expert_application_url(@expert_application)
    assert_response :success
  end

  test "should update expert_application" do
    patch expert_application_url(@expert_application), params: { expert_application: { license_no: @expert_application.license_no, user_id: @expert_application.user_id } }
    assert_redirected_to expert_application_url(@expert_application)
  end

  test "should destroy expert_application" do
    assert_difference('ExpertApplication.count', -1) do
      delete expert_application_url(@expert_application)
    end

    assert_redirected_to expert_applications_url
  end
end
