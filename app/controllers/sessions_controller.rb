class SessionsController < ApplicationController
  def new
  end
  
  def create
    user=User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user #存session
      #remember user #存DB与浏览器都存cookie
      params[:session][:remember_me]=='1' ? remember(user) : forget(user) #三元运算符
      redirect_to user #重定向到users视图下的show视图
    else
      #flash[:danger]='Invalid email/password combination'
      flash.now[:danger]='Invalid email/password combination' #提示会在下次请求时消失
      render 'new'
    end
  end
  
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
