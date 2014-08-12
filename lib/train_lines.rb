require 'spec_helper'

class Line

  attr_accessor :name, :id

  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes[:id].to_i
  end

  def self.all
    lines = []
    results = DB.exec("SELECT * FROM train_lines;")
    results.each do |line|
      name = line['name']
      id =line['id']
      lines << Line.new({:name => name, :id => id})
    end
    lines
  end

  def save
    results = DB.exec("INSERT INTO train_lines (name) VALUES ('#{self.name}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def ==(line_objs)
    @name == line_objs.name
  end

  def add_station(station)
    DB.exec("INSERT INTO stops (line_id, station_id) VALUES ('#{self.id}', '#{station.id}');")
  end

  def stations
    stations = []
    results = DB.exec("SELECT * FROM stops WHERE line_id = '#{self.id}';")
    results.each do |station|
      station_id = station['station_id'].to_i
      station_name = DB.exec("SELECT * FROM train_stations WHERE id = #{station_id};").first['name']
      stations << Station.new({:name => station_name, :id => station_id})
    end
    stations
  end

  def update_line_info(new_info)
    DB.exec("UPDATE train_lines SET name = '#{new_info.name}' WHERE id = #{self.id};")
    @name = new_info.name
  end

  def delete_line!
    DB.exec("DELETE FROM train_lines WHERE id = #{self.id}")
    DB.exec("DELETE FROM stops WHERE id = #{self.id}")
  end
end

