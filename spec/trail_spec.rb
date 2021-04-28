require './lib/trail'

RSpec.describe Trail do

  describe '#initialize' do
    trail = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})

    it 'exists' do
      expect(trail).to be_instance_of(Trail)
    end

    it 'has readable name, length, level attributes' do
      expect(trail.name).to eq('Grand Wash')
      expect(trail.length).to eq('2.2 miles')
      expect(trail.level).to eq(:easy)
    end
  end
end
