class CustomerRequest < ApplicationRecord
  validates :start_latitude, :start_longitude, :end_latitude, :end_longitude, presence: true

  has_one :ride, dependent: :destroy

  after_create :assign_nearest_cab

  private

  def assign_nearest_cab
    cab = Cab.nearest_available(start_latitude, start_longitude)
    if cab
      Ride.create(customer_request: self, cab: cab, start_latitude: start_latitude, start_longitude: start_longitude, end_latitude: end_latitude, end_longitude: end_longitude)
      update(status: 'accepted')
    else
      update(status: 'rejected')
    end
  end
end
