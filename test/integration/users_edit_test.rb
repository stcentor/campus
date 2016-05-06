require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end
  
  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), user: {name: "", email: "444@invalid", 
                                  password: "4444",
                                  password_confirmation: "444"}
    assert_template 'users/edit'
  end
  
  test "successful edit " do
    log_in_as(@user)
    get edit_user_path @user
    assert_template 'users/edit'
    name = "Dyl An"
    email = "Dyl@AN.com"
    patch user_path (@user), user:{ name:  name,
                                    email: email,
                                    password:              "",
                                    password_confirmation: "" }
    assert_not flash.empty?
    assert_redirected_to @user.reload
    assert_equal name, @user.name
    assert_equal email.downcase, @user.email
  end
  
  test "successful edit with friendly forwarding" do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_path(@user)
    name = "Dyl An"
    email = "Dyl@AN.com"
    patch user_path (@user), user:{ name:  name,
                                    email: email,
                                    password:              "",
                                    password_confirmation: "" }
    assert_not flash.empty?
    assert_redirected_to @user.reload
    @user.reload
    assert_equal name, @user.name
    assert_equal email.downcase, @user.email
  end
end
