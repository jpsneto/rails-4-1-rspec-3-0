class UsersController < ApplicationController
  before_action :authenticate
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  #before_action :can_administer?, except: [ :index ]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_url, notice: 'New user created.'
    else
      render :new
    end
  end

  def update
    if @user.update user_params
      redirect_to users_path
    else
      render 'edit'
    end
  end

  private

  def set_user
    @user = User.find params[:id]
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params[:user].delete :admin unless current_user.try(:admin?)
    params.require(:user).permit(:email, :password, :password_confirmation, :admin, :role_ids => [])
  end
end
