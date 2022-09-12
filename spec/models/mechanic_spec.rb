require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'relationships' do
    it { should have_many(:ride_mechs)}
    it { should have_many(:rides).through(:ride_mechs) }
  end
end