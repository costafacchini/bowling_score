require 'spec_helper'
require 'calculator/calculation_rule/strike'
require 'frames/frame_builder'

RSpec.describe CalculationRule::Strike do
  describe '#eligible?' do
    context 'when the frame has a strike' do
      it 'is true' do
        frame1 = FrameBuilder.create_normal_frame
        frame1.add_score('10')

        rule = described_class.new
        expect(rule.eligible?([frame1], 0)).to be true
      end
    end

    context 'when the frame there is no strike' do
      it 'is false' do
        frame1 = FrameBuilder.create_normal_frame
        frame1.add_score('8')

        rule = described_class.new
        expect(rule.eligible?([frame1], 0)).to be false
      end
    end
  end

  describe '#total_for' do
    context 'when followed by another strike and a regular roll' do
      it 'returns total to the frame selected' do
        frame1 = FrameBuilder.create_normal_frame
        frame1.add_score('10')
        frame2 = FrameBuilder.create_normal_frame
        frame2.add_score('10')
        frame3 = FrameBuilder.create_normal_frame
        frame3.add_score('3')
        frame3.add_score('2')

        frames = [frame1, frame2, frame3]
        rule = described_class.new
        expect(rule.total_for(frames, 0)).to eq(23)
      end
    end

    context 'when there is only one more frame after the strike' do
      it 'returns total to the frame selected' do
        frame1 = FrameBuilder.create_normal_frame
        frame1.add_score('10')
        frame2 = FrameBuilder.create_normal_frame
        frame2.add_score('3')
        frame2.add_score('4')

        frames = [frame1, frame2]
        rule = described_class.new
        expect(rule.total_for(frames, 0)).to eq(17)
      end
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
