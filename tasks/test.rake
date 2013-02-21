desc "Run all tests"
task :test do
  glob = File.expand_path('../../tests/**/*.rb', __FILE__)

  Dir[glob].each { |file| require(file) }
end
