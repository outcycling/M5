require 'test_helper'

class ManagePhotosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @manage_photo = manage_photos(:one)
  end

  test "should get index" do
    get manage_photos_url
    assert_response :success
  end

  test "should get new" do
    get new_manage_photo_url
    assert_response :success
  end

  test "should create manage_photo" do
    assert_difference('ManagePhoto.count') do
      post manage_photos_url, params: { manage_photo: { granted: @manage_photo.granted, requestee_id: @manage_photo.requestee_id, requestor_id: @manage_photo.requestor_id } }
    end

    assert_redirected_to manage_photo_url(ManagePhoto.last)
  end

  test "should show manage_photo" do
    get manage_photo_url(@manage_photo)
    assert_response :success
  end

  test "should get edit" do
    get edit_manage_photo_url(@manage_photo)
    assert_response :success
  end

  test "should update manage_photo" do
    patch manage_photo_url(@manage_photo), params: { manage_photo: { granted: @manage_photo.granted, requestee_id: @manage_photo.requestee_id, requestor_id: @manage_photo.requestor_id } }
    assert_redirected_to manage_photo_url(@manage_photo)
  end

  test "should destroy manage_photo" do
    assert_difference('ManagePhoto.count', -1) do
      delete manage_photo_url(@manage_photo)
    end

    assert_redirected_to manage_photos_url
  end
end
