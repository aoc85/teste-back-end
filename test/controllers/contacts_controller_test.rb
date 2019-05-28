require 'test_helper'

class ContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contact = contacts(:one)
  end
  test "should get new" do
    get new_contact_url
    assert_response :success
  end

  test "should create contact" do
    assert_difference "Contact.count" do
      post contacts_url, params: { contact: { email: "teste", name:"contact name" } }
    end
    assert_response :redirect
  end

  test "should not accept empty email contact" do
    assert_no_difference "Contact.count" do
      post contacts_url, params: { contact: {email: "", name: "any" } }
    end
  end
end
