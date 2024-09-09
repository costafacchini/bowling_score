require 'spec_helper'
require 'calculator/calculation_rule/open_frame'
require 'frames/frame_builder'

RSpec.describe CalculationRule::OpenFrame do
  describe '#eligible?' do
    context 'when the frame has a strike' do
      it 'is false' do
        frame1 = FrameBuilder.create_normal_frame
        frame1.add_score('10')
        frame2 = FrameBuilder.create_normal_frame
        frame2.add_score('10')

        rule = described_class.new
        expect(rule.eligible?([frame1, frame2], 0)).to be false
      end
    end

    context 'when the frame has a spare' do
      it 'is false' do
        frame1 = FrameBuilder.create_normal_frame
        frame1.add_score('8')
        frame1.add_score('2')
        frame2 = FrameBuilder.create_normal_frame
        frame2.add_score('F')

        rule = described_class.new
        expect(rule.eligible?([frame1, frame2], 0)).to be false
      end
    end

    context 'when there is no spare and strike on the frame' do
      it 'is true' do
        frame1 = FrameBuilder.create_normal_frame
        frame1.add_score('8')

        rule = described_class.new
        expect(rule.eligible?([frame1], 0)).to be true
      end
    end

    context 'when is the last frame' do
      it 'is true' do
        frame1 = FrameBuilder.create_normal_frame
        frame1.add_score('10')
        frame1.add_score('8')
        frame1.add_score('2')

        rule = described_class.new
        expect(rule.eligible?([frame1], 0)).to be true
      end
    end
  end

  describe '#total_for' do
    it 'returns total to the frame' do
      frame1 = FrameBuilder.create_normal_frame
      frame1.add_score('2')
      frame1.add_score('8')

      frames = [frame1]
      rule = described_class.new
      expect(rule.total_for(frames, 0)).to eq(10)
    end

    context 'when the is the last frame' do
      it 'returns total to the frame' do
        frame1 = FrameBuilder.create_tenth_frame
        frame1.add_score('10')
        frame1.add_score('3')
        frame1.add_score('4')

        frames = [frame1]
        rule = described_class.new
        expect(rule.total_for(frames, 0)).to eq(17)
      end
    end
  end
end
