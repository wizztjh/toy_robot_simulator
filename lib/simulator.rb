class Simulator
  attr_accessor :robot
  def initialize
    self.robot = {}
  end

  def place x, y, direction
    self.robot[:x] = x.to_i
    self.robot[:y] = y.to_i
    self.robot[:direction] = direction
  end

  def report
    puts "#{robot[:x]},#{robot[:y]},#{robot[:direction]}"
  end

  def move
    case self.robot[:direction]
    when 'NORTH' then self.robot[:y] +=1
    when 'SOUTH' then self.robot[:y] -=1
    when 'WEST' then self.robot[:x] -=1
    when 'EAST' then self.robot[:x] +=1
    end
  end
end
