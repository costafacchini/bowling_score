require 'spec_helper'
require 'frame'

RSpec.describe Frame do
  describe '#add_score' do
    context 'when the number of plays is less than rolls limit' do
      it 'adds the score' do
        rolls_limit = 2
        frame = described_class.new(rolls_limit)
        frame.add_score('7')

        expect(frame.scores).to eql(['7'])
      end

      context 'when the total of rolls is less than total pins' do
        it 'does not add the score' do
          rolls_limit = 3
          frame = described_class.new(rolls_limit)
          frame.add_score('1')
          frame.add_score('8')

          expect(frame.scores).to eql(%w[1 8])

          frame.add_score('1')

          expect(frame.scores).to eql(%w[1 8 1])
        end
      end

      context 'when the total of rolls is greather than total pins' do
        it 'does not add the score' do
          rolls_limit = 3
          frame = described_class.new(rolls_limit)
          frame.add_score('1')
          frame.add_score('9')

          expect(frame.scores).to eql(%w[1 9])

          frame.add_score('1')

          expect(frame.scores).to eql(%w[1 9])
        end
      end
    end

    context 'when the number of plays is equal the rolls limit' do
      it 'does not add the score' do
        rolls_limit = 1
        frame = described_class.new(rolls_limit)
        frame.add_score('7')

        expect(frame.scores).to eql(['7'])

        frame.add_score('1')

        expect(frame.scores).to eql(['7'])
      end
    end
  end

  describe '#full?' do
    context 'when the number of plays is less than rolls limit' do
      it 'is false' do
        rolls_limit = 2
        frame = described_class.new(rolls_limit)
        frame.add_score('7')

        expect(frame.full?).to be false
      end

      context 'when the total of rolls is less than total pins' do
        it 'is false' do
          rolls_limit = 3
          frame = described_class.new(rolls_limit)
          frame.add_score('1')
          frame.add_score('8')

          expect(frame.full?).to be false
        end
      end

      context 'when the total of rolls is greather than total pins' do
        it 'is true' do
          rolls_limit = 3
          frame = described_class.new(rolls_limit)
          frame.add_score('2')
          frame.add_score('8')

          expect(frame.full?).to be true
        end
      end
    end

    context 'when the number of plays is equal the rolls limit' do
      it 'is true' do
        rolls_limit = 2
        frame = described_class.new(rolls_limit)
        frame.add_score('7')
        frame.add_score('10')

        expect(frame.full?).to be true
      end
    end
  end
end
