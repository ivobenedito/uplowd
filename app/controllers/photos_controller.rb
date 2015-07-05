class PhotosController < ApplicationController
  before_action :set_photo, only: [:edit, :update, :destroy]

  def index
    @photos = current_property.photos
  end

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

  def download
    photos = current_property.photos
    archive = ArchivePhotosService.new(photos).call

    response.headers['Content-Length'] = archive.size.to_s
    send_file archive, { type: 'application/zip', disposition: 'attachment', filename: 'Photos.zip' }

    archive.close
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

end
