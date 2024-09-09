require 'spec_helper'
require 'test_helper'
require 'calculator/score'
require 'player'

RSpec.describe Calculator::Score do
  describe '#fill_total_scores' do
    it 'fills total scores for pinfalls' do
      player = build_player('John', %w[10 10 10 10 10 10 10 10 10 10 10 10])

      described_class.new.fill_total_scores([player])

      expect(player.pinfalls[0].total).to eq(30)
      expect(player.pinfalls[1].total).to eq(60)
      expect(player.pinfalls[2].total).to eq(90)
      expect(player.pinfalls[3].total).to eq(120)
      expect(player.pinfalls[4].total).to eq(150)
      expect(player.pinfalls[5].total).to eq(180)
      expect(player.pinfalls[6].total).to eq(210)
      expect(player.pinfalls[7].total).to eq(240)
      expect(player.pinfalls[8].total).to eq(270)
      expect(player.pinfalls[9].total).to eq(300)
    end

    context 'when there is more than one player' do
      it 'fills total scores for all players' do
        player1 = build_player('John', %w[10 10 2 6])
        player2 = build_player('Jeff', %w[10 10 4 F])

        described_class.new.fill_total_scores([player1, player2])

        expect(player1.pinfalls[0].total).to eq(22)
        expect(player1.pinfalls[1].total).to eq(40)
        expect(player1.pinfalls[2].total).to eq(48)
        expect(player2.pinfalls[0].total).to eq(24)
        expect(player2.pinfalls[1].total).to eq(38)
        expect(player2.pinfalls[2].total).to eq(42)
      end
    end
  end
end
