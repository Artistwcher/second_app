class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #这里是所有控制器的父类
  include SessionsHelper

end
