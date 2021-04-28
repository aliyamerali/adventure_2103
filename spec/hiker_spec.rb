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
  end

end
