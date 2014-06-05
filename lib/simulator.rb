class Simulator
  attr_accessor :robot
  def initialize
    self.robot = {}
  end

  def place x, y, direction
    self.robot[:x] = x
    self.robot[:y] = y
    self.robot[:direction] = direction
  end

  def report
    puts "#{robot[:x]},#{robot[:y]},#{robot[:direction]}"
  end
end
