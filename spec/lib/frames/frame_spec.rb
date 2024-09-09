require 'spec_helper'
require 'frames/frame'

RSpec.describe Frame do
  describe '#add_score' do
    context 'when the number of plays is less than rolls limit' do
      let(:rolls_limit) { 3 }

      context 'when the total of scores is less than pins limit' do
        let(:pins_limit) { 10 }

        it 'adds the score' do
          frame = described_class.new(rolls_limit, pins_limit)
          frame.add_score('1')
          frame.add_score('8')

          expect(frame.scores).to eql(%w[1 8])

          frame.add_score('1')

          expect(frame.scores).to eql(%w[1 8 1])
        end
      end

      context 'when the total of scores is greather than pins limit' do
        let(:pins_limit) { 8 }

        it 'does not add the score' do
          frame = described_class.new(rolls_limit, pins_limit)
          frame.add_score('9')

          expect(frame.scores).to eql(%w[9])

          frame.add_score('1')

          expect(frame.scores).to eql(%w[9])
        end
      end

      context 'when the total of scores is equal than pins limit' do
        let(:pins_limit) { 9 }

        it 'does not add the score' do
          frame = described_class.new(rolls_limit, pins_limit)
          frame.add_score('1')
          frame.add_score('8')

          expect(frame.scores).to eql(%w[1 8])

          frame.add_score('1')

          expect(frame.scores).to eql(%w[1 8])
        end
      end
    end

    context 'when the number of plays is equal than rolls limit' do
      let(:rolls_limit) { 2 }

      it 'does not add the score' do
        pins_limit = 10
        frame = described_class.new(rolls_limit, pins_limit)
        frame.add_score('1')
        frame.add_score('8')

        expect(frame.scores).to eql(%w[1 8])

        frame.add_score('1')

        expect(frame.scores).to eql(%w[1 8])
      end
    end

    context 'when the number of plays is greather than rolls limit' do
      let(:rolls_limit) { 1 }

      it 'does not add the score' do
        pins_limit = 10
        frame = described_class.new(rolls_limit, pins_limit)
        frame.add_score('1')

        expect(frame.scores).to eql(%w[1])

        frame.add_score('8')

        expect(frame.scores).to eql(%w[1])
      end
    end
  end

  describe '#full?' do
    context 'when the number of plays is less than rolls limit' do
      let(:rolls_limit) { 3 }

      context 'when the total of scores is less than pins limit' do
        let(:pins_limit) { 10 }

        it 'is false' do
          frame = described_class.new(rolls_limit, pins_limit)
          frame.add_score('1')
          frame.add_score('8')

          expect(frame.full?).to be false
        end
      end

      context 'when the total of scores is greather than pins limit' do
        let(:pins_limit) { 8 }

        it 'is true' do
          frame = described_class.new(rolls_limit, pins_limit)
          frame.add_score('1')
          frame.add_score('8')

          expect(frame.full?).to be true
        end
      end

      context 'when the total of scores is equal than pins limit' do
        let(:pins_limit) { 9 }

        it 'is true' do
          frame = described_class.new(rolls_limit, pins_limit)
          frame.add_score('1')
          frame.add_score('8')

          expect(frame.full?).to be true
        end
      end
    end

    context 'when the number of plays is equal than rolls limit' do
      let(:rolls_limit) { 2 }

      it 'is true' do
        pins_limit = 10
        frame = described_class.new(rolls_limit, pins_limit)
        frame.add_score('1')
        frame.add_score('8')

        expect(frame.full?).to be true
      end
    end

    context 'when the number of plays is greather than rolls limit' do
      let(:rolls_limit) { 1 }

      it 'is true' do
        pins_limit = 10
        frame = described_class.new(rolls_limit, pins_limit)
        frame.add_score('1')

        expect(frame.full?).to be true
      end
    end
  end

  describe '#strike?' do
    context 'when the first score is 10' do
      it 'is true' do
        frame = described_class.new(2, 10)
        frame.add_score('10')

        expect(frame.strike?).to be true
      end
    end

    context 'when the first score is not 10' do
      it 'is false' do
        frame = described_class.new(2, 10)
        frame.add_score('8')
        frame.add_score('2')

        expect(frame.strike?).to be false
      end
    end
  end

  describe '#spare?' do
    context 'when the sum of scores is 10' do
      it 'is true' do
        frame = described_class.new(2, 10)
        frame.add_score('3')
        frame.add_score('7')

        expect(frame.spare?).to be true
      end

      context 'when is a strike' do
        it 'is false' do
          frame = described_class.new(1, 10)
          frame.add_score('10')

          expect(frame.spare?).to be false
        end
      end
    end

    context 'when the sum of scores is not 10' do
      it 'is false' do
        frame = described_class.new(2, 10)
        frame.add_score('8')
        frame.add_score('1')

        expect(frame.spare?).to be false
      end
    end
  end
end
