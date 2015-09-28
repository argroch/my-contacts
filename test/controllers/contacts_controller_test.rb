require 'test_helper'

class ContactsControllerTest < ActionController::TestCase
  setup do
    @contact = contacts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contacts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contact" do
    assert_difference('Contact.count') do
      post :create, contact: { address: @contact.address, business_name: @contact.business_name, city: @contact.city, first_name: @contact.first_name, last_name: @contact.last_name, latitude: @contact.latitude, longitude: @contact.longitude, phone1: @contact.phone1, phone2: @contact.phone2, state: @contact.state, zip: @contact.zip }
    end

    assert_redirected_to contact_path(assigns(:contact))
  end

  test "should show contact" do
    get :show, id: @contact
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contact
    assert_response :success
  end

  test "should update contact" do
    patch :update, id: @contact, contact: { address: @contact.address, business_name: @contact.business_name, city: @contact.city, first_name: @contact.first_name, last_name: @contact.last_name, latitude: @contact.latitude, longitude: @contact.longitude, phone1: @contact.phone1, phone2: @contact.phone2, state: @contact.state, zip: @contact.zip }
    assert_redirected_to contact_path(assigns(:contact))
  end

  test "should destroy contact" do
    assert_difference('Contact.count', -1) do
      delete :destroy, id: @contact
    end

    assert_redirected_to contacts_path
  end
end
