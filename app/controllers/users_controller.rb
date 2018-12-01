class UsersController < ApplicationController
  def new
    #用户注册
    @user=User.new #调到注册页面
  end
  
  def show
    @user=User.find(params[:id])
    #debugger
  end
  
  def create
    #@user=User.new(params[:user])
    #下面是健壮参数技术
    @user=User.new(user_params)
    if @user.save
      flash[:success]="Welcome to the Sample App" #赋值给变量
      redirect_to @user #重定向回user_url(@user)？,重定向到用户主页
    else
      render 'new'
    end
    #我擦，ifelse后面要加end的
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  
end
