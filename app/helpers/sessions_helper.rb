module SessionsHelper
    #用户登录
    def log_in(user)
        session[:user_id]=user.id  #session会加密id并保存
    end
    
    #返回当前登录的用户
    def current_user
        #这里@current_user相当于全局变量？
        if(user_id=session[:user_id])
             @current_user ||= User.find_by(id: user_id)
        elsif (user_id=cookies.signed[:user_id])
            user=User.find_by(id: user_id)
            if user && user.authenticate?(cookies[:remember_token])
                log_in user
                @current_user=user
            end
        end
    end
    
    #如果用户已登录则返回true
    def logged_in?
        !current_user.nil?
    end
    
    #持久回话，记住用户
    def remember(user)
        user.remember #数据库存cookie摘要
        cookies.permanent.signed[:user_id]=user.id  #浏览器存cookie与id
        cookies.permanent[:remember_token]=user.remember_token
    end
    
    #忘记cookie
    def forget(user)
        user.forget #DB端
        cookies.delete(:user_id) #浏览器端
        cookies.delete(:remember_token)
    end
    #退出当前用户
    def log_out
        forget(current_user)
        session.delete(:user_id)
        @current_user=nil
    end
end
