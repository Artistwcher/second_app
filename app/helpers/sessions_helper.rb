module SessionsHelper
    #用户登录
    def log_in(user)
        session[:user_id]=user.id  #session会加密id并保存
    end
    
    #返回当前登录的用户
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
    
    #如果用户已登录则返回true
    def logged_in?
        !current_user.nil?
    end
    
    #退出当前用户
    def log_out
        session.delete(:user_id) #这里的符号还是不懂
        @current_user=nil
    end
end
