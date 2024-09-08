require 'spec_helper'
require 'data_loader/validation_rule/invalid_score'

RSpec.describe ValidationRule::InvalidScore do
  describe '#apply' do
    context 'when the input is equal or greather than 0' do
      it 'is valid' do
        expect(described_class.new.apply('0')).to be true
        expect(described_class.new.apply('5')).to be true
      end
    end

    context 'when the input is equal or less than than 10' do
      it 'is valid' do
        expect(described_class.new.apply('8')).to be true
        expect(described_class.new.apply('10')).to be true
      end
    end

    context 'when the input is less than 0' do
      it 'is not valid' do
        expect(described_class.new.apply('-1')).to be false
      end
    end

    context 'when the input is greather than than 10' do
      it 'is not valid' do
        expect(described_class.new.apply('11')).to be false
      end
    end

    context 'when the input is empty' do
      it 'is valid' do
        expect(described_class.new.apply('')).to be true
      end
    end

    context 'when the input is not a number' do
      it 'is valid' do
        expect(described_class.new.apply('z')).to be true
        expect(described_class.new.apply('*')).to be true
        expect(described_class.new.apply('@')).to be true
      end
    end
  end

  describe '#error_message' do
    context 'when the input are between 0 and 10' do
      it 'returns nil' do
        rule = described_class.new
        rule.apply('0')

        expect(rule.error_message).to be nil
      end
    end

    context 'when the input is a negative number' do
      it 'returns the message' do
        rule = described_class.new
        rule.apply('-1')

        expect(rule.error_message).to eql('Invalid score : -1')
      end
    end
  end
end
