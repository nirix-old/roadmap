require "bacon"
require "bacon/colored_output"
require "rack/test"
require "sequel"
Sequel.extension :migration

# Ensure lib directory is in the path
lib = File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

# Database connection
DB = Sequel.sqlite(':memory:')

# Run migrations
Sequel::Migrator.run DB, File.expand_path(__FILE__ + '/../../lib/roadmap/db/migrations')

# Default data
require File.expand_path(__FILE__ + '/../../lib/roadmap/db/defaults.rb')

# Load roadmap
require 'roadmap'

def set_sess(key, val)
  get "/set_sess/#{key}/#{val}"
end

module Roadmap
  module Routes
    class Base
      get '/set_sess/:key/:val' do
        session[params[:key]] = params[:val]
      end
    end
  end
end

# Configure Roadmap
Roadmap.config do |app|
  app.set public_folder: File.dirname(__FILE__) + "/public"
  app.set port: ENV['PORT'] || 3000
  app.set session_secret: "wat"
  app.set environment: :test

  app.database = DB
end

# Insert admin user
Roadmap::Models::User.new({
  name: 'Admin',
  username: 'admin',
  password: 'admin',
  email: 'admin@example.com',
  group_id: 1
}).save

# Insert test user
Roadmap::Models::User.new({
  name: 'Tester',
  username: 'tester',
  password: 'test',
  email: 'test@example.com'
}).save

Bacon.summary_on_exit

Dir.glob(File.expand_path(File.dirname(__FILE__)) + '/**/*.rb').each do |test|
  require(test) if File.basename(test) != 'all.rb' and File.basename(test) != 'test_language.rb'
end
