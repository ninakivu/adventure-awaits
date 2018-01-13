class ImagesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @image.trip = Trip.find(params[:trip_id])
    if @image.save
      flash[:notice] = "Successfully added new photo!"
      redirect_to trip_path(@image.trip)
     else
      flash[:alert] = "Error adding new photo!"
      redirect_to new_trip_image_path
     end 
  end

  def edit
  end

  def update
  end

  def destroy
  end
  private

  def image_params
    params.require(:image).permit(:url, :user_id)
  end 
end
