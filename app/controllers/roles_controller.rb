class RolesController < ApplicationController

  before_action :set_role, only: [:show, :edit, :update, :destroy]


  def index
    @roles = Role.all
  end

  def show
  end

  def new
    @role = Role.new
  end

  def create
    @role = Role.new(role_params)

    if @role.save
      redirect_to role_path(@role)
    else
      render :new
    end

  end

  def update
    if @role.update(role_params)
      redirect_to role_path(@role)
    else
      render :edit
    end
  end

  def destroy
  end

  private
  def set_role
    @role = Role.find params[:id]
  end

  def role_params
    params.require(:role).permit(:name, :activity_ids => [])
  end

end