class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  def index
    @photos = current_property.photos.all
  end

  def show
  end

  def new
    @photo = current_property.photos.new
  end

  def edit
  end

  def create
    current_property.create_photos(photo_params)

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

    def current_property
      @property ||= Property.find(params[:property_id])
    end
    helper_method :current_property

end
