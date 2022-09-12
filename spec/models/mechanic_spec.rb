require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'relationships' do
    it { should have_many(:ride_mechanics)}
    it { should have_many(:rides).through(:ride_mechanics) }
  end

  before(:each) do
    @disney = AmusementPark.create(name: 'Disney Land', admission_cost: 129)
    @bob = Mechanic.create(name: 'Bob', years_experience: 9)
    @hailey = Mechanic.create(name: 'Hailey', years_experience: 12)

    @hurler = Ride.create!(name: "The Hurler", thrill_rating:7, open:false, amusement_park_id: @disney.id)
    @magic = Ride.create!(name: "Magic Mountain", thrill_rating:8, open:true, amusement_park_id: @disney.id)
    @splash = Ride.create!(name: "Splash Mountain", thrill_rating:9, open:true, amusement_park_id: @disney.id)
    @mummy = Ride.create!(name: "The Mummy", thrill_rating:6, open:true, amusement_park_id: @disney.id)

    @bob.rides += [@hurler, @magic, @splash]
  end
  
  it 'returns average experience of mechanics' do
    expect(Mechanic.avg_experience).to eq(10.5)
  end

  it 'returns open rides mechanic is working on by thrill' do
    expect(@bob.open_rides_by_thrill).to eq([@splash, @magic])
  end

  it 'adds a ride to the mechanic' do
    @bob.add_ride(@mummy.id)
    expect(@bob.rides).to include(@mummy)
  end
end