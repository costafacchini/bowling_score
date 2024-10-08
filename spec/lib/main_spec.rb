require 'spec_helper'
require 'main'

RSpec.describe Main do
  let(:perfect) { file_fixture('perfect.txt') }

  context 'when input file is valid' do
    context 'with more than two players' do
      it 'prints the game scoreboard to stdout' do
        stub_const('ARGV', [file_fixture('scores.txt')])

        sample = "Frame\t\t1\t\t2\t\t3\t\t4\t\t5\t\t6\t\t7\t\t8\t\t9\t\t10\n" \
                 "Jeff\n" \
                 "Pinfalls\t\tX\t7\t/\t9\t0\t\tX\t0\t8\t8\t/\tF\t6\t\tX\t\tX\tX\t8\t1\n" \
                 "Score\t\t20\t\t39\t\t48\t\t66\t\t74\t\t84\t\t90\t\t120\t\t148\t\t167\n" \
                 "John\n" \
                 "Pinfalls\t3\t/\t6\t3\t\tX\t8\t1\t\tX\t\tX\t9\t0\t7\t/\t4\t4\tX\t9\t0\n" \
                 "Score\t\t16\t\t25\t\t44\t\t53\t\t82\t\t101\t\t110\t\t124\t\t132\t\t151\n"

        expect { load 'main.rb' }.to output(sample).to_stdout
      end
    end

    context 'with strikes in all throwings' do
      it 'prints a perfect game scoreboard' do
        stub_const('ARGV', [file_fixture('perfect.txt')])

        sample = "Frame\t\t1\t\t2\t\t3\t\t4\t\t5\t\t6\t\t7\t\t8\t\t9\t\t10\n" \
                 "Carl\n" \
                 "Pinfalls\t\tX\t\tX\t\tX\t\tX\t\tX\t\tX\t\tX\t\tX\t\tX\tX\tX\tX\n" \
                 "Score\t\t30\t\t60\t\t90\t\t120\t\t150\t\t180\t\t210\t\t240\t\t270\t\t300\n"

        expect { load 'main.rb' }.to output(sample).to_stdout
      end
    end
  end

  context 'when there is no argument' do
    it 'outputs error message' do
      stub_const('ARGV', [])

      expect { load 'main.rb' }.to output("How to use: ruby lib/main.rb spec/fixtures/positive/scores.txt\n").to_stdout
    end
  end

  context 'when input file is invalid' do
    it 'raises the corresponding error message' do
      stub_const('ARGV', [file_fixture('invalid-format.csv')])

      expect { load 'main.rb' }.to raise_error('Invalid file format')
    end
  end
end
