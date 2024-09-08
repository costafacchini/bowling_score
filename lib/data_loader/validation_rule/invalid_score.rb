require_relative 'base'

module ValidationRule
  class InvalidScore < Base
    def apply(input)
      invalid_scores = input.select { |number| number > 10 }
      @error_message = "Invalid score detected: #{invalid_scores}" if invalid_scores.any?
      @error_message.nil?
    end
  end
end
