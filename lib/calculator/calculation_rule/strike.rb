require_relative 'base'

module CalculationRule
  class Strike < Base
    def eligible?(frames, frame_index)
      frame = frames[frame_index]
      frame.strike?
    end

    def total_for(frames, frame_index)
      return 0 if frames.size - 1 == frame_index

      next_two_rolls = select_next_two_rolls(frames, frame_index)
      10 + next_two_rolls.take(2).sum
    end

    private

    def select_next_two_rolls(frames, frame_index)
      next_two_rolls = frames[frame_index + 1]&.scores.to_a + frames[frame_index + 2]&.scores.to_a
      transform_scores_to_int!(next_two_rolls)
      next_two_rolls
    end

    def transform_scores_to_int!(next_two_rolls)
      next_two_rolls.map!(&:to_i)
    end
  end
end
