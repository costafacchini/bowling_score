require 'spec_helper'
require 'data_loader/text_file'

RSpec.describe DataLoader::TextFile do
  describe '#load_data' do
    context 'when input file is valid' do
      it 'loads players names' do
        data_loader = described_class.new(file_fixture('scores.txt'))
        data_loader.load_data

        expect(data_loader.players.size).to eq(2)
        expect(data_loader.players[0].name).to eq('Jeff')
        expect(data_loader.players[1].name).to eq('John')
      end

      it 'loads players pinfalls' do
        data_loader = described_class.new(file_fixture('scores.txt'))
        data_loader.load_data

        expect(data_loader.players[0].pinfalls).to eq(%w[10 7 3 9 0 10 0 8 8 2 F 6
                                                         10 10 10 8 1])
        expect(data_loader.players[1].pinfalls).to eq(%w[3 7 6 3 10 8 1 10 10 9 0 7
                                                         3 4 4 10 9 0])
      end
    end

    context 'when input file is invalid' do
      it 'raises the corresponding error message' do
        data_loader = described_class.new(file_fixture('invalid-format.csv'))
        expect { data_loader.load_data }.to raise_error(DataLoader::Error, 'Invalid file format')
      end
    end

    context 'with input file has invalid score' do
      it 'raises the corresponding error message ' do
        data_loader = described_class.new(file_fixture('negative.txt'))
        expect { data_loader.load_data }.to raise_error(DataLoader::Error, /Invalid score : -/)
      end
    end
  end
end
