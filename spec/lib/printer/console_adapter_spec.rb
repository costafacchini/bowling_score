require 'spec_helper'
require 'printer/console_adapter'
require 'player'
require 'calculator/score'

RSpec.describe Printer::ConsoleAdapter do
  def build_player(name, scores)
    player = Player.new(name)
    scores.each do |score|
      player.add_score_at_pinfall(score)
    end
    Calculator::Score.new.fill_total_scores([player])

    player
  end

  describe '#print' do
    it 'prints bowling card scoring' do
      player1 = build_player('John',
                             %w[10 7 3 9 0 10 0 8 8 2 F 6 10 10 10 8 1])
      player2 = build_player('Jeff',
                             %w[3 7 6 3 10 8 1 10 10 9 0 7 3 4 4 10 9 1])

      sample = "Frame\t\t1\t\t2\t\t3\t\t4\t\t5\t\t6\t\t7\t\t8\t\t9\t\t10\n" \
               "John\n" \
               "Pinfalls\t\tX\t7\t/\t9\t0\t\tX\t0\t8\t8\t/\tF\t6\t\tX\t\tX\tX\t8\t1\n" \
               "Score\t\t20\t\t39\t\t48\t\t66\t\t74\t\t84\t\t90\t\t120\t\t148\t\t167\n" \
               "Jeff\n" \
               "Pinfalls\t3\t/\t6\t3\t\tX\t8\t1\t\tX\t\tX\t9\t0\t7\t/\t4\t4\tX\t9\t/\n" \
               "Score\t\t16\t\t25\t\t44\t\t53\t\t82\t\t101\t\t110\t\t124\t\t132\t\t152\n"

      printer = described_class.new

      expect { printer.print([player1, player2]) }.to output(sample).to_stdout
    end
  end
end
