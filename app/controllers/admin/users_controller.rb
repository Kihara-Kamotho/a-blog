class Admin::UsersController < Admin::ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.order(:email)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User has been created"
      redirect_to admin_users_path
    else
      flash[:notice] = "Error prohibited user from creating"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    # do not update if password is blank
    if params[:user][:password].blank?
      params[:user].delete(:password)
    end
    
    if @user.update(user_params)
      flash[:notice] = "User has been updated"
      redirect_to admin_users_path
    else
      flash[:notice] = "User not updated"
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :admin)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
