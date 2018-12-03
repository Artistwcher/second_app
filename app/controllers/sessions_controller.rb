class SessionsController < ApplicationController
  def new
  end
  
  def create
    user=User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #登录并重定向
      log_in user
      redirect_to user ##重定向到users视图下的show视图
    else
      #显示错误信息
      #flash[:danger]='Invalid email/password combination'
      flash.now[:danger]='Invalid email/password combination' #提示会在下次请求时消失
      render 'new'
    end
  end
  
  def destroy
    log_out
    redirect_to root_url
  end
end
