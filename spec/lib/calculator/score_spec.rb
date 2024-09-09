require 'spec_helper'
require 'calculator/score'
require 'player'

RSpec.describe Calculator::Score do
  describe '#fill_total_scores' do
    # rubocop:disable RSpec/ExampleLength
    it 'fills total scores for pinfalls' do
      player = Player.new('John')
      player.add_score_at_pinfall('10')
      player.add_score_at_pinfall('10')
      player.add_score_at_pinfall('10')
      player.add_score_at_pinfall('10')
      player.add_score_at_pinfall('10')
      player.add_score_at_pinfall('10')
      player.add_score_at_pinfall('10')
      player.add_score_at_pinfall('10')
      player.add_score_at_pinfall('10')
      player.add_score_at_pinfall('10')
      player.add_score_at_pinfall('10')
      player.add_score_at_pinfall('10')

      described_class.new.fill_total_scores([player])

      expect(player.pinfalls[0].total).to eq(30)
      expect(player.pinfalls[1].total).to eq(30)
      expect(player.pinfalls[2].total).to eq(30)
      expect(player.pinfalls[3].total).to eq(30)
      expect(player.pinfalls[4].total).to eq(30)
      expect(player.pinfalls[5].total).to eq(30)
      expect(player.pinfalls[6].total).to eq(30)
      expect(player.pinfalls[7].total).to eq(30)
      expect(player.pinfalls[8].total).to eq(30)
      expect(player.pinfalls[9].total).to eq(0)
    end

    context 'when there is more than one player' do
      it 'fills total scores for all players' do
        player1 = Player.new('John')
        player1.add_score_at_pinfall('10')
        player1.add_score_at_pinfall('10')
        player1.add_score_at_pinfall('2')
        player1.add_score_at_pinfall('6')

        player2 = Player.new('Jeff')
        player2.add_score_at_pinfall('10')
        player2.add_score_at_pinfall('10')
        player2.add_score_at_pinfall('4')
        player2.add_score_at_pinfall('F')

        described_class.new.fill_total_scores([player1, player2])

        expect(player1.pinfalls[0].total).to eq(22)
        expect(player1.pinfalls[1].total).to eq(18)
        expect(player1.pinfalls[2].total).to eq(0)
        expect(player2.pinfalls[0].total).to eq(24)
        expect(player2.pinfalls[1].total).to eq(14)
        expect(player2.pinfalls[2].total).to eq(0)
      end
    end
    # rubocop:enable RSpec/ExampleLength
  end
end
