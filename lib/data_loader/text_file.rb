require 'player'
require_relative 'base'

module DataLoader
  class TextFile < Base
    def initialize(source)
      super()
      @source = source
    end

    def load_data
      validate_file_format
      validate_file_empty

      File.readlines(@source).each_with_index do |line, index|
        name, score = line.split
        validate_score(score, index)

        player = create_or_load_player(name)
        player.add_score_at_pinfall(score)
      end

      check_errors
    end

    private

    def validate_file_format
      raise Error, 'Invalid file format' unless File.extname(@source) == '.txt'
    end

    def validate_file_empty
      raise Error, 'Empty file informed' if File.zero?(@source)
    end

    def create_or_load_player(name)
      player = @players.find { |p| p.name == name }
      if player.nil?
        player = Player.new(name)
        @players << player
      end
      player
    end
  end
end
