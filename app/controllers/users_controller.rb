class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  
  def new
    @user = User.new
  end
  
  def show
  end
  
  def index
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user #保存成功後、ログインする
      flash[:success] = "新規作成に成功!"
      redirect_to user_url(@user)
    else
      render :new
    
    end
  end 
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
 #private
 
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :department, :password, :password_confirmation)
  end
 
 
end
