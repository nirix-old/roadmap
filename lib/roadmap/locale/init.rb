Dir.glob(File.dirname(__FILE__) + '/**/*.rb').each do |language|
  require(language) if File.basename(language) != 'init.rb'
end