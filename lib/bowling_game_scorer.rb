class BowlingGameScorer
  def initialize(data_loader, calculator_score, printer_adapter)
    @data_loader = data_loader
    @calculator_score = calculator_score
    @printer_adapter = printer_adapter
  end

  def process
    @data_loader.load_data
    @calculator_score.fill_total_scores(@data_loader.players)
    @printer_adapter.print(@data_loader.players)
  end
end
