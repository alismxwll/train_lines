require 'spec_helper'

class Line

  attr_accessor :name, :id

  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes[:id].to_i
  end

  def self.all
    []
  end

  def save
    results = DB.exec("INSERT INTO train_lines (name) VALUES ('#{self.name}') RETURNING id;")
    @id = results.first['id'].to_i
  end
end
