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

    it 'starts with an empty array of trails' do
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

  describe 'trail management' do
    trail1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})
    trail2 = Trail.new({name: 'Cohab Canyon', length: '1.7 miles', level: :moderate})
    trail3 = Trail.new({name: 'Chimney Rock Loop', length: '3.6 miles', level: :strenuous})
    trail4 = Trail.new({name: "Queen's/Navajo Loop", length: '2.9 miles', level: :moderate})
    trail5 = Trail.new({name: 'Rim Trail', length: '11 miles', level: :easy})
    trail6 = Trail.new({name: 'Tower Bridge', length: '3 miles', level: :moderate})
    park1 = Park.new('Capitol Reef')
    park2 = Park.new('Bryce Canyon')
    park1.add_trail(trail1)
    park1.add_trail(trail2)
    park1.add_trail(trail3)
    park2.add_trail(trail4)
    park2.add_trail(trail5)
    park2.add_trail(trail6)

    it '#trails_shorter_than returns trails shorter than given length' do
      expect(park1.trails_shorter_than(2.5)).to eq([trail1, trail2])
      expect(park2.trails_shorter_than(2.5)).to eq([])
    end

  end

end
