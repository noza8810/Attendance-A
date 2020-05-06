class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:show, :edit, :update]
  before_action :admin_user, only: [:index, :destroy]
  
  
  def new
    @user = User.new
  end
  
  def show
  end
  
  def index
    @users = User.where.not(id: 1)
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
    if @user.update_attributes(user_params)
      flash[:success]= "ユーザー情報を更新しました。"
      redirect_to user_url(@user)
    else
      render :edit
    end
  end
  
  def destroy
    @user.destroy
    flash[:success] = "#{@user.name}のデータを削除しました。"
    redirect_to users_url
  end
  
  def import
    # fileはtmpに自動で一時保存される
    if (params[:file])
      User.import(params[:file])
      redirect_to users_url 
    else 
      flash[:danger] = "インポートファイルが選択されていません。"
      redirect_to users_url
    end
  end

  
 # private
 
  def user_params
    params.require(:user).permit(:name, :email, :department, :password, :password_confirmation)
  end
  
  
 # beforeフィルター  
  
  #paramsハッシュからユーザーを取得
  def set_user
    @user = User.find(params[:id])
  end
  
  #ログイン済のユーザーか確認
  def logged_in_user
    unless logged_in?
      store_location 
      flash[:danger] = "ログインしてください"
      redirect_to login_url
    end
  end
  
  # アクセスしたユーザーが現在ログインしているユーザーか確認
  def correct_user
    redirect_to(root_path) unless current_user?(@user)
  end
  
  #管理権限有りユーザーか判定
  def admin_user
    unless current_user.admin?
     redirect_to root_url
    end
  end
    
end

