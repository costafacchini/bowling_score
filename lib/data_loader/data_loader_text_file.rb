require 'player'
require_relative 'data_loader_base'

class DataLoaderTextFile < DataLoaderBase
  attr_reader :players, :errors

  def initialize(source)
    super()
    @source = source
  end

  def load_data
    validate_file_format!
    File.readlines(@source).each do |line|
      name, score = line.split

      player = @players.find { |p| p.name == name } || Player.new(name)
      player.pinfalls << score
      @players << player unless @players.include?(player)
    end
  end

  private

  def validate_file_format!
    raise DataLoaderError, 'Invalid file format' unless File.extname(@source) == '.txt'
  end
end
