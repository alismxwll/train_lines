require 'rspec'
require 'train_stations'
require 'train_lines'
require 'pg'
require 'pry'

DB = PG.connect(:dbname => 'train_system_test')

RSpec.configure do |config|
  config.after(:each) do
    DB.exec('DELETE FROM train_stations *;')
    # DB.exec('DELETE FROM train_lines *')
  end
end
