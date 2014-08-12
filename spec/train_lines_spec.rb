require 'spec_helper'

describe Line do
  it 'will initialize a Line object' do
    line = Line.new({:name => 'Blue Line'})
    expect(line).to be_an_instance_of Line
  end

  it 'starts with an empty array of lines' do
    expect(Line.all).to eq []
  end
end
