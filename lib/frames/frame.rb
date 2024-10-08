class Frame
  attr_reader :scores
  attr_accessor :total

  def initialize(rolls_limit, pins_limit)
    @rolls_limit = rolls_limit
    @pins_limit = pins_limit
    @scores = []
    @total = 0
  end

  def add_score(score)
    @scores << score unless full?
  end

  def full?
    @scores.size == @rolls_limit || @scores.sum(&:to_i) >= @pins_limit
  end

  def strike?
    @scores.size == 1 && @scores[0].to_i == 10
  end

  def spare?
    @scores.size > 1 && @scores.sum(&:to_i) == 10
  end
end
