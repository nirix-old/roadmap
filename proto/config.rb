
Roadmap.config do |app|
  app.set public_folder: File.dirname(__FILE__) + "/public"
  app.set port: ENV['PORT'] || 3000
  app.set session_secret: "change-this"
  app.set environment: :production

  app.database = Sequel.connect('mysql2://root:root@localhost/roadmap')
end
