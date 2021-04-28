require './lib/park'
require './lib/trail'
require './lib/hiker'
require 'date'

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

    it '#hikeable_miles returns total length of trails in a park' do
      expect(park1.hikeable_miles).to eq(7.5)
      expect(park2.hikeable_miles).to eq(16.9)
    end

    it '#trails_by_level returns hash with level keys and trail name values' do
      expected1 = {
                   :easy => ["Grand Wash"],
                   :moderate => ["Cohab Canyon"],
                   :strenuous => ["Chimney Rock Loop"]
                 }
      expected2 = {
                   :moderate => ["Queen's/Navajo Loop", "Tower Bridge"],
                   :easy => ["Rim Trail"]
                 }
      expect(park1.trails_by_level).to eq(expected1)
      expect(park2.trails_by_level).to eq(expected2)
    end
  end

  it '#visitors_log returns hash by year of visitors by date including visitor possible trails' do
    trail1 = Trail.new({name: 'Rim Trail', length: '11 miles', level: :easy})
    trail2 = Trail.new({name: "Queen's/Navajo Loop", length: '2.9 miles', level: :moderate})
    trail3 = Trail.new({name: 'Tower Bridge', length: '3 miles', level: :moderate})
    trail4 = Trail.new({name: 'Peekaboo Loop', length: '5.5 miles', level: :strenuous})
    park = Park.new('Bryce Canyon')
    park.add_trail(trail1)
    park.add_trail(trail2)
    park.add_trail(trail3)
    park.add_trail(trail4)
    hiker1 = Hiker.new('Dora', :moderate)
    hiker2 = Hiker.new('Frank', :easy)
    hiker3 = Hiker.new('Jack', :strenuous)
    hiker4 = Hiker.new('Sally', :strenuous)
    
    #This visit occurs on June 23, 1980
    allow(Date).to receive(:today) {Date.new(1980,06,23)}
    hiker1.visit(park)

    #This visit occurs on June 24, 1980
    allow(Date).to receive(:today) {Date.new(1980,06,24)}
    hiker2.visit(park)
    hiker3.visit(park)

    #This visit occurs on June 25, 1980
    allow(Date).to receive(:today) {Date.new(1980,06,25)}
    hiker4.visit(park)

    #This visit occurs on June 23, 2020
    allow(Date).to receive(:today) {Date.new(2020,06,23)}
    hiker1.visit(park)

    #This visit occurs on June 24, 2020
    allow(Date).to receive(:today) {Date.new(2020,06,24)}
    hiker2.visit(park)
    hiker3.visit(park)

    #This visit occurs on June 25, 2020
    allow(Date).to receive(:today) {Date.new(2020,06,25)}
    hiker4.visit(park)

    expected = {
       1980 => {
                 "06/23" => {
                   #<Hiker:0x00007f8f02184208...> => [#<Trail:0x00007f8f040e25c8...>, #<Trail:0x00007f8f03191ee8...>]
                 },
                 "06/24" => {
                   #<Hiker:0x00007f8f029afb30...> => [#<Trail:0x00007f8f022c6878...>],
                   #<Hiker:0x00007f8f04045e30...> => [#<Trail:0x00007f8f022e5160...>]
                 },
                 "06/25" => {
                   #<Hiker:0x00007f8f02326390...> => [#<Trail:0x00007f8f022e5160...>]
                 }
              },
       2020 => {
                 "06/23" => {
                   #<Hiker:0x00007f8f02184208...> => [#<Trail:0x00007f8f040e25c8...>, #<Trail:0x00007f8f03191ee8...>]
                 },
                 "06/24" => {
                   #<Hiker:0x00007f8f029afb30...> => [#<Trail:0x00007f8f022c6878...>],
                   #<Hiker:0x00007f8f04045e30...> => [#<Trail:0x00007f8f022e5160...>]
                 },
                 "06/25" => {
                   #<Hiker:0x00007f8f02326390...> => [#<Trail:0x00007f8f022e5160...>]
                 }
               },
      }

    expect(park.visitors_log).to eq(expected)
  end

end
