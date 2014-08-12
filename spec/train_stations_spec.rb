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
end
