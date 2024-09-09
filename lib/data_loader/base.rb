require_relative 'validation_rule/invalid_score'
require_relative 'validation_rule/incorrect_format'

module DataLoader
  class Error < StandardError; end

  class Base
    attr_accessor :players, :errors

    def initialize
      @players = []
      @errors = []
      @validation_rules = [
        ValidationRule::InvalidScore.new,
        ValidationRule::IncorrectFormat.new
      ]
    end

    def load_data; end

    private

    def validate_score(score, index)
      @validation_rules.each { |rule| @errors << "Line #{index}: #{rule.error_message}" unless rule.apply(score) }
    end

    def check_errors
      validate_throws
      raise Error, "Fix erros and try again: \n#{@errors.join("\n")}" if @errors.any?
    end

    def validate_throws
      @players.each do |player|
        @errors << "Player #{player.name} has extra score" if player.pinfalls.size > 10
      end
    end
  end
end
