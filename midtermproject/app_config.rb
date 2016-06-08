require 'active_record'
require 'active_support/all'
require './lib/events_importer'
require './lib/images_importer'
require './app/models/event'
# Add new app/ and lib/ files here when they are created.

module AppConfig

  DATABASE = ENV['DATABASE'] || 'development'

  DATABASE_PATH = File.absolute_path("db/#{DATABASE}.sqlite3", File.dirname(__FILE__))

  def self.establish_connection
    puts "Connecting to database '#{DATABASE_PATH}'"
    ActiveRecord::Base.establish_connection(
      adapter: 'sqlite3',
      database: DATABASE_PATH
    )
  end

end