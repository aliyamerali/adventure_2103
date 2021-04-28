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

  describe '#visit' do
    hiker = Hiker.new('Dora', :moderate)
    park1 = Park.new('Capitol Reef')
    park2 = Park.new('Bryce Canyon')
    hiker.visit(park1)
    hiker.visit(park2)

    it 'adds park to the parks_visited array' do
      expect(hiker.parks_visited).to eq([park1, park2])
    end
  end

end
