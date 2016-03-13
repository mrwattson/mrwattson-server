require 'bundler/setup'
require 'grape'
require 'grape/activerecord'
require 'grape/activerecord/rake'
require 'serialport'
require './app/models/reading.rb'
require './lib/reader.rb'
require './lib/sender.rb'
require 'http'

task :code_analysis do
  sh 'bundle exec rubocop'
  sh 'bundle exec reek'
  sh 'bundle exec rspec'
end

namespace :db do
  desc 'basic env'
  task :environment do
    Grape::ActiveRecord.database_file = 'config/database.yml'
  end
end

namespace :reader do
  desc 'listen to reading device and save records on each read'
  task :listen do
    Grape::ActiveRecord.database_file = 'config/database.yml'

    Reader.listen
  end
end
