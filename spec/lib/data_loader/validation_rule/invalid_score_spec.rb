require 'spec_helper'
require 'data_loader/validation_rule/invalid_score'

RSpec.describe ValidationRule::InvalidScore do
  describe '#apply' do
    context 'when all scores are valid' do
      it 'returns true' do
        input = [10, 5, 7, 9, 8]
        expect(described_class.new.apply(input)).to be true
      end
    end

    context 'when there is an invalid score' do
      it 'returns false' do
        input = [10, 5, 11, 9, 8]
        expect(described_class.new.apply(input)).to be false
      end
    end

    context 'when input is empty' do
      it 'returns true' do
        input = []
        expect(described_class.new.apply(input)).to be true
      end
    end
  end

  describe '#error_message' do
    context 'when all scores are valid' do
      it 'does not have error message' do
        input = [10, 5, 7, 9, 8]

        rule = described_class.new
        rule.apply(input)

        expect(rule.error_message).to be nil
      end
    end

    context 'when there is an invalid score' do
      it 'has error message' do
        input = [10, 5, 11, 9, 12]

        rule = described_class.new
        rule.apply(input)

        expect(rule.error_message).to eql "Invalid score detected: [11, 12]"
      end
    end
  end
end