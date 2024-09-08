require 'spec_helper'
require 'player'

RSpec.describe Player do
  describe '#add_score_at_pinfall' do
    context 'when the frame is not full' do
      it 'adds the score to the last frame' do
        player = described_class.new('John Doe')
        player.add_score_at_pinfall('1')

        expect(player.name).to eql('John Doe')
        expect(player.pinfalls.size).to be(1)

        player.add_score_at_pinfall('3')

        expect(player.pinfalls.size).to be(1)
        expect(player.pinfalls[0].scores).to eql(%w[1 3])
      end
    end

    context 'when the frame is full' do
      it 'adds the score to a new frame' do
        player = described_class.new('John Doe')
        player.add_score_at_pinfall('1')
        player.add_score_at_pinfall('2')

        expect(player.pinfalls.size).to be(1)

        player.add_score_at_pinfall('3')

        expect(player.pinfalls.size).to be(2)
        expect(player.pinfalls[1].scores).to eql(['3'])
      end
    end

    context 'when already have 9 frames full' do
      it 'adds the score to a tenth frame with 3 rolls' do
        player = described_class.new('John Doe')
        player.add_score_at_pinfall('10')
        player.add_score_at_pinfall('10')
        player.add_score_at_pinfall('10')
        player.add_score_at_pinfall('10')
        player.add_score_at_pinfall('10')
        player.add_score_at_pinfall('10')
        player.add_score_at_pinfall('10')
        player.add_score_at_pinfall('10')
        player.add_score_at_pinfall('10')

        expect(player.pinfalls.size).to be(9)

        player.add_score_at_pinfall('10')
        player.add_score_at_pinfall('10')
        player.add_score_at_pinfall('8')

        expect(player.pinfalls.size).to be(10)
        expect(player.pinfalls[9].scores).to eql(['10', '10', '8'])
      end
    end
  end
end
