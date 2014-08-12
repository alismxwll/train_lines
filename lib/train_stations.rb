require 'spec_helper'

class Station

  attr_accessor :name, :id

  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes[:id].to_i
  end

  def self.all
    stations = []
    results = DB.exec("SELECT * FROM train_stations;")
    results.each do |station|
      name = station['name']
      id = station['id'].to_i
      stations << Station.new({:name => name, :id => id})
    end
    stations
  end

  def save
    results = DB.exec("INSERT INTO train_stations (name) VALUES ('#{self.name}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def ==(station_objs)
    @name == station_objs.name
  end

end
