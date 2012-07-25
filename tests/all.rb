Dir.glob(File.expand_path(File.dirname(__FILE__)) + '/**/*.rb').each do |test|
  require(test) if File.basename(test) != 'all.rb' and File.basename(test) != 'test_locale.rb'
end