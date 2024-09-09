require 'spec_helper'
require 'frames/frame_builder'

RSpec.describe FrameBuilder do
  describe '.create_normal_frame' do
    it 'create a frame with 2 rolls limit and 10 pins limit' do
      frame = described_class.create_normal_frame
      frame.add_score('2')
      frame.add_score('8')
      frame.add_score('1')

      expect(frame.scores.size).to be(2)
      expect(frame.scores).to eql(%w[2 8])
    end
  end

  describe '.create_tenth_frame' do
    it 'create a frame with 3 rolls limit and 30 pins limit' do
      frame = described_class.create_tenth_frame
      frame.add_score('10')
      frame.add_score('10')
      frame.add_score('10')
      frame.add_score('1')

      expect(frame.scores.size).to be(3)
      expect(frame.scores).to eql(%w[10 10 10])
    end
  end
end
