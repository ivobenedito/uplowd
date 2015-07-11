class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  def index
    @properties = Property.all
  end

  def edit; end
  def show; end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)

    if @property.save
      redirect_to @property, notice: 'Property was successfully created.'
    else
      :new
    end
  end

  def update
    if @property.update(property_params)
      redirect_to @property, notice: 'Property was successfully updated.'
    else
      render :show
    end
  end

  private

    def property_params
      params.require(:property).permit(:title, :description, photos_files: [])
    end

    def set_property
      @property ||= Property.find(params[:id])
    end

end
