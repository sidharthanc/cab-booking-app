class Ride < ApplicationRecord
  belongs_to :cab
  belongs_to :customer_request

  def calculate_fare
    distance = calculate_distance(start_latitude, start_longitude, end_latitude, end_longitude)
    fare_rate = cab.cab_type == 'regular' ? 12 : 18
    distance * fare_rate
  end

  def end_ride
    update(fare: calculate_fare)
    customer_request.update(status: 'completed')
    cab.update(availability: true, latitude: customer_request.end_latitude, longitude: customer_request.end_longitude)
  end

  private

  def calculate_distance(lat1, lon1, lat2, lon2)
    Geocoder::Calculations.distance_between([lat1, lon1], [lat2, lon2])
  end
end
