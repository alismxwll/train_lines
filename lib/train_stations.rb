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

  def list_names
    names = []
    station_names = DB.exec("SELECT name FROM train_stations;")
    station_names.each do |name|
      names << name['name']
    end
    names
  end

  def update_station_info(new_info)
    DB.exec("UPDATE train_stations SET name = '#{new_info.name}' WHERE id = #{self.id};")
    @name = new_info.name
  end

  def delete_station!
    DB.exec("DELETE FROM train_stations WHERE id = #{self.id};")
    DB.exec("DELETE FROM stops WHERE station_id = #{self.id};")
  end
end
