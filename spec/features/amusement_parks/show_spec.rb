require 'rails_helper'

RSpec.describe 'the mechanics show page' do
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

    it 'shows rides alphabetically and admissions' do
        visit "/amusement_parks/#{@disney.id}"
        save_and_open_page
        expect(page).to have_content("Admissions: $#{@disney.admission_cost}.00")
        expect(@magic.name).to appear_before(@splash.name)
        expect(@hurler.name).to appear_before(@mummy.name)
    end
end