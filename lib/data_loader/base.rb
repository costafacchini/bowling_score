module DataLoader
  class Error < StandardError; end

  class Base
    attr_accessor :players, :validation_rules

    def initialize
      @players = []
    end

    def load_data; end
  end
end
