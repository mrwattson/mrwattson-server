dir = File.dirname(__FILE__)

# APP wrapper
module MrWattsonRaspberry
  # Endpoints Wrapper
  module Endpoints
  end

  # Persistency Wrapper
  module Models
  end
end

require 'bundler'
Bundler.require(:default, ENV['RACK_ENV'] || :development)

# Require necessary libraries
require 'grape'
require 'active_record'
require 'http'

# Establish database connection based on the config file
Grape::ActiveRecord.database_file = 'config/database.yml'

require "#{dir}/app/api/v1/about.rb"
require "#{dir}/app/api/v1/base.rb"
require "#{dir}/app/models/reading.rb"
require "#{dir}/lib/reader.rb"
require "#{dir}/lib/sender.rb"
