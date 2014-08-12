require 'spec_helper'

describe Station do
  it 'will initialize a Station object' do
    station = Station.new({:name => 'Glenco Station'})
    expect(station).to be_an_instance_of Station
  end

  it 'starts with an empty array of stations' do
    Station.all
    expect(Station.all).to eq []
  end

  it 'will save all stations to the database' do
    station = Station.new({:name => 'Dolly Station'})
    station.save
    expect(Station.all).to eq [station]
  end

  it 'will list out all of the stations' do
    station = Station.new({:name => 'Stacy Station'})
    station.save
    expect(Station.all).to eq [station]
  end
end
