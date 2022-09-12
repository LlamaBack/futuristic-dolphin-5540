class Mechanic < ApplicationRecord
    has_many :ride_mechanics
    has_many :rides, through: :ride_mechanics

    def self.avg_experience
        self.all.average(:years_experience).round(2)
    end
end