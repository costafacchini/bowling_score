require_relative 'data_loader/text_file'
require_relative 'bowling_game_scorer'

class Main
  if ARGV.empty?
    puts 'How to use: ruby lib/main.rb spec/fixtures/positive/scores.txt'
  else
    source = ARGV[0]
    data_loader = DataLoader::TextFile.new(source)
    bowling_game_scorer = BowlingGameScorer.new(data_loader)
    bowling_game_scorer.process
  end
end
