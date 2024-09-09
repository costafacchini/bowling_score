class BowlingGameScorer
  def initialize(data_loader)
    @data_loader = data_loader
  end

  def process
    @data_loader.load_data
  end
end
