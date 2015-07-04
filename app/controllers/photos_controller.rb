class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  def index
    @photos = Photo.all
  end

  def show
  end

  def new
    @photo = Photo.new
  end

  def edit
  end

  def create
    @photo = Photo.new(photo_params)

    if @photo.save
      redirect_to @photo, notice: 'Success!'
    else
      render :new
    end
  end

  def update
    if @photo.update(photo_params)
      redirect_to @photo
    else
      render :edit
    end
  end

  def destroy
    if @photo.destroy
      redirect_to photos_path, notice: 'Success!'
    end
  end

  private

    def photo_params
      params.require(:photo).permit(:file, :caption)
    end

    def set_photo
      @photo = Photo.find(params[:id])
    end

end
