require_relative 'data_loader/text_file'
require_relative 'calculator/score'
require_relative 'bowling_game_scorer'
require_relative 'printer/console_adapter'

class Main
  if ARGV.empty?
    puts 'How to use: ruby lib/main.rb spec/fixtures/positive/scores.txt'
  else
    source = ARGV[0]
    data_loader = DataLoader::TextFile.new(source)
    calculator_score = Calculator::Score.new
    printer_adapter = Printer::ConsoleAdapter.new
    bowling_game_scorer = BowlingGameScorer.new(data_loader, calculator_score, printer_adapter)
    bowling_game_scorer.process
  end
end
