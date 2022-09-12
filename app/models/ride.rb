class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :ride_mechs
  has_many :mechanics, through: :ride_mechs
end