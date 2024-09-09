require 'spec_helper'
require 'calculator/calculation_rule/spare'
require 'frames/frame_builder'

RSpec.describe CalculationRule::Spare do
  describe '#total_for' do
    it 'returns total to the frame plus the first score for next frame' do
      frame1 = FrameBuilder.create_normal_frame
      frame1.add_score('2')
      frame1.add_score('8')
      frame2 = FrameBuilder.create_normal_frame
      frame2.add_score('4')

      frames = [frame1, frame2]
      rule = described_class.new
      expect(rule.total_for(frames, 0)).to eq(14)
    end

    context 'when the is the last frame' do
      it 'returns zero' do
        frame1 = FrameBuilder.create_tenth_frame
        frame1.add_score('10')
        frame1.add_score('3')
        frame1.add_score('4')

        frames = [frame1]
        rule = described_class.new
        expect(rule.total_for(frames, 0)).to eq(0)
      end
    end
  end
end
