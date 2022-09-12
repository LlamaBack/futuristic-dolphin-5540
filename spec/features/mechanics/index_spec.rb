require 'rails_helper'

RSpec.describe 'the mechanics index' do
    before(:each) do
        @bob = Mechanic.create(name: 'Bob', years_experience: 9)
        @hailey = Mechanic.create(name: 'Hailey', years_experience: 12)
      end
    it 'lists all the mechancs with their years of experience' do
        visit '/mechanics'
        expect(page).to have_content("All Mechanics")
        expect(page).to have_content(@bob.name)
        expect(page).to have_content(@bob.years_experience)
        expect(page).to have_content(@hailey.name)
        expect(page).to have_content(@hailey.years_experience)
    end

    it 'gives average yesrs of experience across all mechanics' do
        visit '/mechanics'
        expect(page).to have_content("Average Experience: 10.5")
    end
end