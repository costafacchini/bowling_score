module ValidationRule
  class Base
    attr_reader :error_message

    def apply(input); end
  end
end
