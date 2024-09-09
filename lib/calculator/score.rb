require_relative 'calculation_rule/strike'
require_relative 'calculation_rule/spare'
require_relative 'calculation_rule/open_frame'

module Calculator
  class Score
    def initialize
      @calculation_rules = [
        CalculationRule::Strike.new,
        CalculationRule::Spare.new,
        CalculationRule::OpenFrame.new
      ]
    end

    def fill_total_scores(players)
      players.each do |player|
        player.pinfalls.each_with_index do |_, index|
          @calculation_rules.each do |rule|
            if rule.eligible?(player.pinfalls, index)
              player.pinfalls[index].total = player.pinfalls[index - 1].total + rule.total_for(player.pinfalls, index)
            end
          end
        end
      end
    end
  end
end
