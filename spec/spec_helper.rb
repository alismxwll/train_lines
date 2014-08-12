require 'rspec'
require 'train_stations'
require 'pg'
require 'pry'

DB = PG.connect(:dbname => 'train_system_test')

RSpec.configure do |config|
  config.after(:each) do
    DB.exec('DELETE FROM train_stations *;')
  end
end
