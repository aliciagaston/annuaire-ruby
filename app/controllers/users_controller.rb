class UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit, :update]

  def index
		@users = User.all.order(:first_name)
  end
  def load_user
    @user = User.find params[:id]
  end
  def update
    @user.update(params.require(:user).permit(:first_name, :last_name, :date_of_birth, :email, :phone_number))
    redirect_to :action=>'show', :id => @user
  end
end
