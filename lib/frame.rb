class Frame
  attr_reader :scores
  attr_accessor :total

  TOTAL_PINS = 10

  def initialize(rolls_limit)
    @scores = []
    @rolls_limit = rolls_limit
    @total = 0
  end

  def add_score(score)
    @scores << score unless full?
  end

  def full?
    @scores.size == @rolls_limit || scores.sum(&:to_i) >= TOTAL_PINS
  end
end
