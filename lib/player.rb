require_relative 'frames/frame_builder'

class Player
  attr_reader :name
  attr_accessor :pinfalls

  def initialize(name)
    @name = name
    @pinfalls = [FrameBuilder.create_normal_frame]
  end

  def add_score_at_pinfall(score)
    last_frame = @pinfalls[pinfalls.size - 1]
    if last_frame.full?
      frame = @pinfalls.size < 9 ? FrameBuilder.create_normal_frame : FrameBuilder.create_tenth_frame
      frame.add_score(score)
      @pinfalls << frame
    else
      last_frame.add_score(score)
    end
  end
end
