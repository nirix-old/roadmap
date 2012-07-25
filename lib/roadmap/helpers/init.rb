Dir.glob(File.dirname(__FILE__) + '/**/*.rb').each do |helper|
  require(helper)
end