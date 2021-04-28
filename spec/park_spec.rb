require './lib/park'

RSpec.describe Park do

  describe '#initialize' do
    park = Park.new('Capitol Reef')

    it 'exists' do
      expect(park).to be_instance_of(Park)
    end

    it 'has readable name attribute' do
      expect(park.name).to eq('Capitol Reef')
    end

    it 'has starts with an empty array of trails' do
      expect(park.trails).to eq([])
    end
  end

end
