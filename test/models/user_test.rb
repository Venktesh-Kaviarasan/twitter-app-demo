require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name: 'abc', email: 'abc@gmail.com', password: 'foobar', password_confirmation: 'foobar')
  end

  test "email address should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert duplicate_user.valid?
  end

  test "password should not be empty" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end
end
