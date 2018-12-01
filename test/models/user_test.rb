require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    #setup方法会在每个测试方法运行前执行
    @user=User.new(name:"Example User",email:"user@example.com",password:"foobar",password_confirmation:"foobar")
  end
  
  test "should be vaild" do
    assert @user.valid?
  end
  
  test "name should be present" do
    @user.name=" "
    assert_not @user.valid?
  end
  
  test "email should be present" do
    @user.email=" "
    assert_not @user.valid?
  end
  
  test "name should not be too long" do
    @user.name="a"*51
    assert_not @user.valid?
  end
  
  test "email should not be too long" do
    @user.email="a"*244+"@example.com"
    assert_not @user.valid?
  end
  
  #唯一性验证，拒绝重复的邮件地址
  test "email address should be unique" do
    duplicate_user=@user.dup
    duplicate_user.email=@user.email.upcase #要不区分大小写
    @user.save
    assert_not duplicate_user.valid?
  end
  
end
