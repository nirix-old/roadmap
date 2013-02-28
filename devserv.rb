lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'roadmap'

Roadmap.config do |app|
  app.set public_folder: File.dirname(__FILE__) + "/proto/public"
  app.set port: ENV['PORT'] || 3000
  app.set session_secret: "change-this"
  app.set environment: :development

  app.database = Sequel.connect('mysql2://root:root@localhost/roadmap')
end

Roadmap.start
