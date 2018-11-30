require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "layout links" do
    get root_path
    assert_template 'static_pages/home' #检查首页是否正确渲染
    assert_select "a[href=?]", root_path, count:1
    assert_select "a[href=?]", help_path  # ？会自动替换成 help_path
    assert_select "a[href=?]", about_path #等价于检查<a href="/about">...<a>这句话有没有
    assert_select "a[href=?]", contact_path
  end
end
