require './lib/trail'

RSpec.describe Trail do

  describe '#initialize' do
    trail = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})

    it 'exists' do
      expect(trail).to be_instance_of(Trail)
    end

    it 'has readable name, length, level attributes' do

    end
  end
end
