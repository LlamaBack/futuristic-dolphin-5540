class Mechanic < ApplicationRecord
    has_many :ride_mechs
    has_many :rides, through: :ride_mechs
end