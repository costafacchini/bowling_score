class Main
  if ARGV.empty?
    puts 'How to use: ruby bowling.rb path/to/file.txt'
  else
    source = ARGV[0]
    data_loader = DataLoader::TextFile.new(source)
    data_loader.load_data
  end
end
