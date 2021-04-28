require './lib/park'
require './lib/trail'

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

  describe '#add_trail' do
    park = Park.new('Capitol Reef')
    trail1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})
    trail2 = Trail.new({name: 'Cohab Canyon', length: '1.7 miles', level: :moderate})

    it 'adds a trail to the trails array' do
      park.add_trail(trail1)
      park.add_trail(trail2)

      expect(park.trails).to eq([trail1, trail2])
    end
  end

end
