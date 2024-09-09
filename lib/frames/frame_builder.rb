require_relative 'frame'

class FrameBuilder
  def self.create_normal_frame
    rolls_limit = 2
    pins_limit = 10
    Frame.new(rolls_limit, pins_limit)
  end

  def self.create_tenth_frame
    rolls_limit = 3
    pins_limit = 30
    Frame.new(rolls_limit, pins_limit)
  end
end
