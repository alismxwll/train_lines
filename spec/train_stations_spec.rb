require 'spec_helper'

describe Station do
  it 'will initialize a Station object' do
    station = Station.new({:name => 'Glenco Station'})
    expect(station).to be_an_instance_of Station
  end

  it 'starts with an empty array of stations' do
    expect(Station.all).to eq []
  end

  it 'will save all stations to the database' do
    station = Station.new({:name => 'Dolly Station'})
    station.save
    expect(Station.all).to eq [station]
  end

  it 'is the same station if they have the same name' do
    station1 = Station.new({:name => 'Folly Station'})
    station2 = Station.new({:name => 'Folly Station'})
    station1.save
    station2.save
    expect(station1).to eq station2
  end

  it 'will read out all station names' do
    station = Station.new({:name => 'End'})
    station.save
    expect(station.list_names).to eq ['End']
  end

  it 'will update the name of a station' do
    station1 = Station.new({:name => 'Folly Station'})
    station1.save
    station2 = Station.new({:name => 'Red Duck Cove'})
    station1.update_name(station2)
    expect(station1).to eq [station2]
  end
end
