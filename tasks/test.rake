desc "Run all tests"
task :test do
  require File.expand_path('../../tests/all.rb', __FILE__)
end
