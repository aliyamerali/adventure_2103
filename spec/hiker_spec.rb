require './lib/park'
require './lib/trail'
require './lib/hiker'

RSpec.describe Hiker do

  describe '#initialize' do
    hiker = Hiker.new('Dora', :moderate)

    it 'exists' do
      expect(hiker).to be_instance_of(Hiker)
    end

    it 'has attributes name and experience level' do
      expect(hiker.name).to eq("Dora")
      expect(hiker.experience_level).to eq(:moderate)
    end

    it 'starts with an empty hash of snacks' do
      expect(hiker.snacks).to eq({})
    end

    it 'starts with an empty array of parks visited' do
      expect(hiker.parks_visited).to eq([])
    end
  end

  describe '#pack' do
    hiker = Hiker.new('Dora', :moderate)
    hiker.pack('water', 1)
    hiker.pack('trail mix', 3)

    it 'adds snack and amounts to the @snacks hash' do
      expect(hiker.snacks).to eq({"water"=>1, "trail mix"=>3})
    end

    it 'if snack item already exists, adds count to value in @snacks hash' do
      hiker.pack('water', 1)
      expect(hiker.snacks).to eq({"water"=>2, "trail mix"=>3})
    end
  end

  describe '#favorite_snack' do
    hiker = Hiker.new('Dora', :moderate)
    hiker.pack('water', 2)
    hiker.pack('trail mix', 1)
    hiker.pack('apple', 4)
    hiker.pack('carrot', 3)

    it 'returns the name of the snack the hiker has packed the most of' do
      expect(hiker.favorite_snack).to eq("apple")
    end

  end

  describe '#visit' do
    hiker = Hiker.new('Dora', :moderate)
    park1 = Park.new('Capitol Reef')
    park2 = Park.new('Bryce Canyon')
    hiker.visit(park1)
    hiker.visit(park2)

    it 'adds park to the parks_visited array' do
      expect(hiker.parks_visited).to eq([park1, park2])
    end

    it 'does not add a park multiple times if it is visited more than once' do
      hiker.visit(park2)
      expect(hiker.parks_visited).to eq([park1, park2])
    end
  end

  describe '#possible_trails' do
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
    hiker = Hiker.new('Dora', :moderate)
    hiker.visit(park1)
    hiker.visit(park2)

    it 'returns array of trails at parks hiker visited that match experience level' do
      expect(hiker.possible_trails).to eq([trail2, trail4, trail6])
    end
  end

end
