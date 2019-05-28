require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  setup do
    Contact.delete_all
  end

  test "should not save empty contact" do
    contact = Contact.new
    assert_not contact.save
  end

  test "should save contact" do
    contact = Contact.new( { email: "teste@teste", name: "teste" })
    assert contact.save
  end

  test "should not save same email twice" do
    contact1 = Contact.new({ email: "teste@teste", name: "teste" })
    contact1.save
    contact2 = Contact.new({ email: "teste@teste", name: "teste 2" })
    assert_not contact2.save
  end
end
