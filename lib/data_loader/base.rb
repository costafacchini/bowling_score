require_relative 'validation_rule/invalid_score'

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

    def check_errors
      raise Error, "Fix erros and try again: \n#{@errors.join("\n")}" if @errors.any?
    end

    def validate_score(score, index)
      @validation_rules.each { |rule| @errors << "Line #{index}: #{rule.error_message}" unless rule.apply(score) }
    end
  end
end
