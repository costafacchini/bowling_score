require 'spec_helper'
require 'main'

RSpec.describe Main do
  let(:perfect) { file_fixture('perfect.txt') }

  context 'when input file is valid' do
    context 'with more than two players' do
      xit 'prints the game scoreboard to stdout' do
      end
    end

    context 'with strikes in all throwings' do
      xit 'prints a perfect game scoreboard' do
      end
    end

    context 'with fouls in all throwings' do
      xit 'prints the game scoreboard to stdout' do
      end
    end
  end

  context 'when there is no argument' do
    it 'outputs error message' do
      stub_const('ARGV', [])

      expect { load 'main.rb' }.to output("How to use: ruby bowling.rb path/to/file.txt\n").to_stdout
    end
  end

  context 'when input file is invalid' do
    it 'raises the corresponding error message' do
      stub_const('ARGV', [file_fixture('invalid-format.csv')])

      expect { load 'main.rb' }.to raise_error('Invalid file format')
    end
  end
end
