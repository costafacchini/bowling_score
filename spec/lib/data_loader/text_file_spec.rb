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

      # rubocop:disable RSpec/ExampleLength
      it 'loads players pinfalls' do
        data_loader = described_class.new(file_fixture('scores.txt'))
        data_loader.load_data

        expect(data_loader.players.size).to eq(2)
        expect(data_loader.players[0].pinfalls.size).to eq(10)
        expect(data_loader.players[0].pinfalls[0].scores.size).to eq(1)
        expect(data_loader.players[0].pinfalls[0].scores[0]).to eq('10')
        expect(data_loader.players[0].pinfalls[1].scores.size).to eq(2)
        expect(data_loader.players[0].pinfalls[1].scores[0]).to eq('7')
        expect(data_loader.players[0].pinfalls[1].scores[1]).to eq('3')
        expect(data_loader.players[0].pinfalls[2].scores[0]).to eq('9')
        expect(data_loader.players[0].pinfalls[2].scores[1]).to eq('0')
        expect(data_loader.players[0].pinfalls[3].scores[0]).to eq('10')
        expect(data_loader.players[0].pinfalls[4].scores[0]).to eq('0')
        expect(data_loader.players[0].pinfalls[4].scores[1]).to eq('8')
        expect(data_loader.players[0].pinfalls[5].scores[0]).to eq('8')
        expect(data_loader.players[0].pinfalls[5].scores[1]).to eq('2')
        expect(data_loader.players[0].pinfalls[6].scores[0]).to eq('F')
        expect(data_loader.players[0].pinfalls[6].scores[1]).to eq('6')
        expect(data_loader.players[0].pinfalls[7].scores[0]).to eq('10')
        expect(data_loader.players[0].pinfalls[8].scores[0]).to eq('10')
        expect(data_loader.players[0].pinfalls[9].scores[0]).to eq('10')
        expect(data_loader.players[0].pinfalls[9].scores[1]).to eq('8')
        expect(data_loader.players[0].pinfalls[9].scores[2]).to eq('1')
      end
      # rubocop:enable RSpec/ExampleLength
    end

    context 'when input file is invalid' do
      it 'raises the corresponding error message' do
        data_loader = described_class.new(file_fixture('invalid-format.csv'))
        expect { data_loader.load_data }.to raise_error(DataLoader::Error, 'Invalid file format')
      end
    end

    context 'when input file has negative score' do
      it 'raises the corresponding error message ' do
        data_loader = described_class.new(file_fixture('negative.txt'))
        expect { data_loader.load_data }.to raise_error(DataLoader::Error, /Invalid score : -/)
      end
    end

    context 'when input file has free text' do
      it 'raises the corresponding error message ' do
        data_loader = described_class.new(file_fixture('free-text.txt'))
        expect { data_loader.load_data }.to raise_error(DataLoader::Error, /Invalid format :/)
      end
    end

    context 'when input file has invalid score' do
      it 'raises the corresponding error message ' do
        data_loader = described_class.new(file_fixture('invalid-score.txt'))
        expect { data_loader.load_data }.to raise_error(DataLoader::Error, /Invalid format :/)
      end
    end

    context 'when input file is empty' do
      it 'raises the corresponding error message ' do
        data_loader = described_class.new(file_fixture('empty.txt'))
        expect { data_loader.load_data }.to raise_error(DataLoader::Error, 'Empty file informed')
      end
    end

    context 'when input file has extra score' do
      it 'raises the corresponding error message ' do
        data_loader = described_class.new(file_fixture('extra-score.txt'))
        expect { data_loader.load_data }.to raise_error(DataLoader::Error, /has extra score/)
      end
    end
  end
end
