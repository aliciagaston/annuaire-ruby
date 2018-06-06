class PhotosController < ApplicationController
  before_action :load_user
  before_action :load_photo, only: [:show, :edit, :update, :destroy]
  def load_photo
    @photo = Photo.find params[:id]
  end
  def load_user
    @user = User.find params[:user_id]
  end
  def authorized_attributes
    params
        .require(:photo)
        .permit(:file, :name)
  end
  def index
    @photos = @user.photos
  end
  def update
    if @photo.update(authorized_attributes)
      redirect_to @user
    else
      render "edit"
    end
  end
  def new
    @photo = Photo.new
  end
  def create
    @photo = Photo.new authorized_attributes
    @photo.user_id = @user.id
    if @photo.save
      redirect_to @user
    else
      render "new"
    end
  end
  def destroy
    @photo.destroy
    redirect_to @user
  end
end
