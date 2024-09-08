require_relative 'base'

module ValidationRule
  class IncorrectFormat < Base
    FOUL = 'F'.freeze

    def apply(input)
      @error_message = "Invalid format : #{input}" unless [FOUL, ''].include?(input.to_s.gsub(/[^a-zA-Z]/, '').upcase)
      @error_message.nil?
    end
  end
end
