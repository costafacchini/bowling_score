module Printer
  class Base
    def print(players); end

    protected

    def normalize_frame_score(frame)
      if frame.strike?
        ['', 'X']
      elsif frame.spare?
        [frame.scores[0], '/']
      else
        scores = frame.scores.map { |score| score == '10' ? 'X' : score }
        scores[scores.size - 1] = '/' if scores.sum(&:to_i) == 10
        scores
      end
    end
  end
end
