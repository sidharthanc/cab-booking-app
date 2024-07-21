class Cab < ApplicationRecord
  # Your Cab model code
  validates :latitude, :longitude, presence: true
  validates :cab_type, inclusion: { in: ['regular', 'premium'] }

  scope :available, -> { where(availability: true) }
  def self.nearest_available(latitude, longitude)
    available_cabs = available
    return nil if available_cabs.empty?

    # Filter cabs within 10 km radius
    nearby_cabs = available_cabs.select do |cab|
      cab.distance_to(latitude, longitude) <= 10.0
    end

    return nil if nearby_cabs.empty?

    # Find the nearest cab among the nearby cabs
    nearest_cab = nearby_cabs.min_by { |cab| cab.distance_to(latitude, longitude) }
    
    # Update availability (if needed)
    nearest_cab.update(availability: false) unless nearest_cab.availability == false
    
    nearest_cab
  end

  def distance_to(latitude, longitude)
    Geocoder::Calculations.distance_between([self.latitude, self.longitude], [latitude, longitude])
  end
end
