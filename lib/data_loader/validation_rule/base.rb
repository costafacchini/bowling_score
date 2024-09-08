module ValidationRule
  class Base
    attr_reader :error_message

    def initialize
      @error_message = nil
    end

    def apply(input); end
  end
end
