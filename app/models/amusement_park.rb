class AmusementPark < ApplicationRecord
  has_many :rides

  def rides_by_name
    rides.order(:name)
  end

  def avg_thrill
    total_thrill = 0.0
    rides.each do |ride|
      total_thrill += ride.thrill_rating
    end

    total_thrill / rides.length
  end
end