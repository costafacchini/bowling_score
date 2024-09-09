require_relative 'base'

module CalculationRule
  class OpenFrame < Base
    def eligible?(frames, frame_index)
      frame = frames[frame_index]
      !frame.spare? && !frame.strike? || frames.size - 1 == frame_index
    end

    def total_for(frames, frame_index)
      frames[frame_index]&.scores.sum(&:to_i)
    end
  end
end
