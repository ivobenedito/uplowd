class PhotosController < ApplicationController
  before_action :set_photo, only: [:edit, :update, :destroy]

  def edit; end

  def update
    if @photo.update(photo_params)
      redirect_to @photo
    else
      render :edit
    end
  end

  def destroy
    if @photo.destroy
      redirect_to @photo.property, notice: 'Success!'
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
