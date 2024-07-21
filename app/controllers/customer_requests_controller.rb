class CustomerRequestsController < ApplicationController
  def new
    @customer_request = CustomerRequest.new
  end

  def create
    @customer_request = CustomerRequest.new(customer_request_params)
    if @customer_request.save && @customer_request.ride.present?
      redirect_to ride_path(@customer_request.ride)
    else
      flash[:alert] = 'No Cabs available, Please try again later.'
      redirect_to new_customer_request_path
    end
  end

  def show
    @customer_request = CustomerRequest.find(params[:id])
  end

  private

  def customer_request_params
    params.require(:customer_request).permit(:start_latitude, :start_longitude, :end_latitude, :end_longitude)
  end
end

