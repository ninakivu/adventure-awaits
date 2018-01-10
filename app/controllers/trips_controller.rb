class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    if @trip.save
      redirect_to trip_path(@trip)
    else 
      redirect_to new_trip_path(@trip)
    end 
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:user_id])
    if @trip.update(trip_params)
      redirect_to trip_path(@trip)
    else 
      redirect_to edit_trip_path(@trip)
    end 
  end

  def destroy
    @trip = Trip.find(params[:id])
    @user = User.find(params[:user_id])
    if @trip.destroy
      redirect_to user_path(@user)
    end 
  end

  private 
  def trip_params
    params.require(:trip).permit(:title, :destinations, :map, :participants, :begin_date, :duration, :activities, :highlights, :image)
  end 
end
