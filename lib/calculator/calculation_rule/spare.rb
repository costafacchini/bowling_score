require_relative 'base'

module CalculationRule
  class Spare < Base
    def eligible?(frame)
      frame.spare?
    end

    def total_for(frames, frame_index)
      return 0 if frames.size - 1 == frame_index

      10 + frames[frame_index + 1]&.scores&.first.to_i
    end
  end
end
