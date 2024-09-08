class DataLoaderError < StandardError; end

class DataLoaderBase
  attr_accessor :players, :validation_rules

  def initialize
    @players = []
    @validation_rules = []
  end

  def load_data; end
end
