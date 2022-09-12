require 'rails_helper'

RSpec.describe AmusementPark, type: :model do
  describe 'relationships' do
    it { should have_many(:rides) }
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

  it 'lists rides in order by name' do
    expect(@disney.rides_by_name).to eq([@magic, @splash, @hurler, @mummy])
  end

  it 'returns average thrill' do
    expect(@disney.avg_thrill).to eq(7.5)
  end
end