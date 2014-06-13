class Simulator
  attr_accessor :robot
  CARDINAL_DIRECTIONS = ["NORTH","EAST", "SOUTH", "WEST"]

  GRID = {
    X: 0..4,
    Y: 0..4
  }

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
    original_robot = self.robot.clone

    case self.robot[:direction]
    when 'NORTH' then self.robot[:y] +=1
    when 'SOUTH' then self.robot[:y] -=1
    when 'WEST' then self.robot[:x] -=1
    when 'EAST' then self.robot[:x] +=1
    end

    self.robot = original_robot unless within_grid? #revert to original position
  end

  def left
    self.robot[:direction] = CARDINAL_DIRECTIONS[(cardinal_direction_index-1)%4]
  end

  def right
    self.robot[:direction] = CARDINAL_DIRECTIONS[(cardinal_direction_index+1)%4]
  end

  private
  def within_grid?
    # NOTE: check if the x and y is within the GRID range
    GRID[:X].include?(self.robot[:x]) and GRID[:Y].include?(self.robot[:y])
  end

  def cardinal_direction_index
    CARDINAL_DIRECTIONS.index self.robot[:direction]
  end
end
