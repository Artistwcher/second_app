require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get root" do#用来测试跟路由
    get root_url
    assert_response :success #表示成功响应码为200
  end

  test "should get home" do
    #get static_pages_home_url
    get root_path
    assert_response :success #表示成功响应码为200
  end

  test "should get help" do
    #get static_pages_help_url
    get help_path
    assert_response :success
  end
  
##下面是自己编写的测试
  test "should get about" do
    #get static_pages_about_url
    get about_path
    assert_response :success
  end
##下面要加入联系界面
  test "should get contact" do
    #get static_pages_contact_url
    get contact_path
    assert_response :success
  end

end
