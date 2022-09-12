class Mechanic < ApplicationRecord
    has_many :ride_mechanics
    has_many :rides, through: :ride_mechanics

    def self.avg_experience
        self.all.average(:years_experience).round(2)
    end

    def open_rides_by_thrill
        rides.order(thrill_rating: :desc).where("open = true")
    end

    def add_ride(ride)
        rides << Ride.find(ride)
    end
end