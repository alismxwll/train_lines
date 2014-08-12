require 'spec_helper'

class Station

  attr_accessor :name, :id

  def initialize(attributes)
    @name = attributes['name']
    @id = attributes['id'].to_i
  end

  def self.all
    []
  end

  def save
    station_save = DB.exec("INSERT INTO train_stations (name) VALUES ('#{@name}') RETURNING id;")
    @id = station_save.first['id'].to_i
  end

end
