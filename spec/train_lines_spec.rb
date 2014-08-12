require 'spec_helper'

describe Line do
  it 'will initialize a Line object' do
    line = Line.new({:name => 'Blue Line'})
    expect(line).to be_an_instance_of Line
  end

  it 'starts with an empty array of lines' do
    expect(Line.all).to eq []
  end

  it 'will save all the Lines to the database' do
    line = Line.new({:name => 'Blue Line'})
    line.save
    expect(Line.all).to eq [line]
  end

  it 'will be the same Line if it has the same name' do
    line1 = Line.new({:name => 'Blue Line'})
    line1.save
    line2 = Line.new({:name => 'Blue Line'})
    line2.save
    expect(line1).to eq line2
  end

  it "'add_station' will add a Station to a Line & 'list_stations' lists them out" do
    line1 = Line.new({:name => 'Blue Line'})
    line1.save
    station1 = Station.new({:name => 'Folly Station'})
    station1.save
    line1.add_station(station1)
    expect(line1.stations).to eq [station1]
  end

  it 'will update the name of a line' do
    line1 = Line.new({:name => 'Andrews Folly'})
    line1.save
    line2 = Line.new({:name => 'Andrews Salvation'})
    line1.update_line_info(line2)
    expect(line1.name).to eq 'Andrews Salvation'
  end

  it 'will delete a line' do
    line1 = Line.new({:name => 'Blue Line'})
    line1.save
    station1 = Station.new({:name => 'Folly Station'})
    station1.save
    line1.delete_line!
    expect(Line.all).to eq []
  end

  it 'will list out the stations in a particular line' do
    line1 = Line.new({:name => 'Red Line'})
    line1.save
    station1 = Station.new({:name => 'Red Duck Cove'})
    station1.save
    line1.add_station(station1)
    station2 = Station.new({:name => 'Ducks N Pirates'})
    station2.save
    line1.add_station(station2)
    expect(Line.all).to eq [line1]
    expect(line1.list_stations).to eq [station1, station2]
  end
end
