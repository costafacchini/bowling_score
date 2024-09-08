require 'spec_helper'
require 'data_loader/validation_rule/incorrect_format'

RSpec.describe ValidationRule::IncorrectFormat do
  describe '#apply' do
    context 'when the input if F' do
      it 'is valid' do
        expect(described_class.new.apply('F')).to be true
        expect(described_class.new.apply('f')).to be true
      end
    end

    context 'when the input is a number' do
      it 'is valid' do
        expect(described_class.new.apply('8')).to be true
      end
    end

    context 'when the input is empty' do
      it 'is valid' do
        expect(described_class.new.apply('')).to be true
      end
    end

    context 'when the input is free text' do
      it 'is not valid' do
        expect(described_class.new.apply('X')).to be false
        expect(described_class.new.apply('x')).to be false
      end
    end
  end

  describe '#error_message' do
    context 'when the input is valid' do
      it 'returns nil' do
        rule = described_class.new
        rule.apply('F')

        expect(rule.error_message).to be nil
      end
    end

    context 'when the input is invalid' do
      it 'returns the message' do
        rule = described_class.new
        rule.apply('text')

        expect(rule.error_message).to eql('Invalid format : text')
      end
    end
  end
end
