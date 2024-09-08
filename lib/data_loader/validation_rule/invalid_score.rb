require_relative 'base'

module ValidationRule
  class InvalidScore < Base
    def apply(input)
      @error_message = "Invalid score : #{input}" unless (0..10).include?(input.to_i)
      @error_message.nil?
    end
  end
end
