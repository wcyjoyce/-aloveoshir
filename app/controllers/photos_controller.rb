class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :destroy]

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to photos_path
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @photo.destroy
    redirect_to photos_path
  end

  private

  def photo_params
    params.require(:photo).permit(:photo, :caption)
  end

  def set_photo
    @photo = Photo.find(params[:id])
  end
end

