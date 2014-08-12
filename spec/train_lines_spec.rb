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
    expect(line.name).to eq 'Blue Line'
  end

  it 'will be the same Line if it has the same name' do
    line1 = Line.new({:name => 'Blue Line'})
    line1.save
    line2 = Line.new({:name => 'Blue Line'})
    line2.save
    expect(line1).to eq line2
  end
end
