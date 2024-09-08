require_relative 'frame'

class Player
  attr_reader :name
  attr_accessor :pinfalls

  NORMAL_FRAME_ROLLS = 2
  TENTH_FRAME_ROLLS = 3

  def initialize(name)
    @name = name
    @pinfalls = [Frame.new(NORMAL_FRAME_ROLLS)]
  end

  def add_score_at_pinfall(score)
    last_frame = @pinfalls[pinfalls.size - 1]
    if last_frame.full?
      frame = @pinfalls.size <= 9 ? Frame.new(NORMAL_FRAME_ROLLS) : Frame.new(TENTH_FRAME_ROLLS)
      frame.add_score(score)
      @pinfalls << frame
    else
      last_frame.add_score(score)
    end
  end
end
