class UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit, :update, :destroy]

  def index
		@users = User.all.order(:first_name)
  end
  def load_user
    @user = User.find params[:id]
  end
  def update
    if @user.update(authorized_attributes)
      redirect_to @user
    else
      render "edit"
    end
  end
  def authorized_attributes
    params
        .require(:user)
        .permit(:first_name, :last_name, :date_of_birth, :email, :phone_number)
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new authorized_attributes
    if @user.save
      redirect_to @user
    else
      render "new"
    end
  end
  def destroy
    @user.destroy
    redirect_to :users
  end
end
