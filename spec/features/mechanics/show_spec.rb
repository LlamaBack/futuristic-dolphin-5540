require 'rails_helper'

RSpec.describe 'the mechanics show page' do
    before(:each) do
        @disney = AmusementPark.create(name: 'Disney Land', admission_cost: 129)
        @bob = Mechanic.create(name: 'Bob', years_experience: 9)
        @hailey = Mechanic.create(name: 'Hailey', years_experience: 12)

        @hurler = Ride.create!(name: "The Hurler", thrill_rating:7, open:false, amusement_park_id: @disney.id)
        @magic = Ride.create!(name: "Magic Mountain", thrill_rating:8, open:true, amusement_park_id: @disney.id)
        @splash = Ride.create!(name: "Splash Mountain", thrill_rating:9, open:true, amusement_park_id: @disney.id)

        @bob.rides += [@hurler, @magic, @splash]
    end

    it 'shows open rides the mechanic is working on ordered by thrill' do
        visit "/mechanics/#{@bob.id}"
        expect(@splash.name).to appear_before(@magic.name)
        expect(@splash.name).to_not have_content(@hurler.name)
    end
end