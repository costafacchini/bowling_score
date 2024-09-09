class BowlingGameScorer
  def initialize(data_loader, calculator_score)
    @data_loader = data_loader
    @calculator_score = calculator_score
  end

  def process
    @data_loader.load_data
    @calculator_score.fill_total_scores(@data_loader.players)
  end
end
