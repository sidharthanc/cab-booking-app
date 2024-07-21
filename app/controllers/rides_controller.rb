class RidesController < ApplicationController
  def show
    @ride = Ride.find(params[:id])
  end

  def update_ride
    @ride = Ride.find(params[:id])
    puts "yesssssssssss"
    @ride.end_ride
    redirect_to ride_path(@ride)
  end
end

