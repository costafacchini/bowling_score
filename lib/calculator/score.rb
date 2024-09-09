require_relative 'calculation_rule/strike'
require_relative 'calculation_rule/spare'

module Calculator
  class Score
    def initialize
      @calculation_rules = [
        CalculationRule::Strike.new,
        CalculationRule::Spare.new
      ]
    end

    def fill_total_scores(players)
      players.each do |player|
        player.pinfalls.each_with_index do |_, index|
          @calculation_rules.each do |rule|
            if rule.eligible?(player.pinfalls[index])
              player.pinfalls[index].total = rule.total_for(player.pinfalls, index)
            end
          end
        end
      end
    end
  end
end
