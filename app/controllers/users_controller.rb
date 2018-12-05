class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]#前置过滤器,只有登录了才能执行后面操作
  before_action :correct_user, only:[:edit, :update] #用户只能改自己的资料
  before_action :admin_user, only: :destroy  #执行destory前先执行admin_user
  
  def index
    #@users=User.all
    #@users=User.paginate(page: params[:page])  #实现用户分页（默认30个）
    #@users=User.page(params[:page] || 1).per_page(params[:per_page] || 10).order("id desc")
    @users=User.page(params[:page] || 1).per_page(params[:per_page] || 10)
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success]="User deleted"
    redirect_to users_url
  end
  
  def new
    #用户注册
    @user=User.new #调到注册页面
  end
  
  def show
    @user=User.find(params[:id])
    #debugger
  end
  
  #create是存储用户注册的
  def create
    #@user=User.new(params[:user])
    @user=User.new(user_params)
    if @user.save
      log_in @user #用户注册后立马存入id
      flash[:success]="Welcome to the Sample App" #赋值给变量
      redirect_to @user #重定向回user_url(@user)？,重定向到用户主页
    else
      render 'new'
    end
  end
  #编辑页面
  def edit
    @user=User.find(params[:id])#获取页面传值的id
  end
  #用户编辑完资料传到update
  def update
    @user=User.find(params[:id])
    if @user.update_attributes(user_params)
      #success
      flash[:success]="Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  #定义第一个前置过滤器函数
  #确认必须先登录
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger]="Please log in"
      redirect_to login_url
    end
  end
  #第二个过滤器
  def correct_user
    @user=User.find(params[:id]) #页面中的id与登录的id是否为同一个人
    redirect_to(root_url) unless current_user?(@user)
  end
  
  private
    #下面是健壮参数技术
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    #确保是管理员，才能执行删除操作
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
  
end
