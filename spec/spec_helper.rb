require 'pry-byebug'
require 'tempfile'

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }

require 'cli'

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  config.order = 'random'
end

RSpec.shared_examples 'a robot movement' do |direction, expected_robot_status|
  describe "when the robot is facing #{direction}" do
    before { subject.place 2, 2, direction }

    it "moves one grid to the #{direction}" do
      subject.move
      expect(subject.robot).to include expected_robot_status
    end
  end
end

RSpec.shared_examples 'an out of boundries movement' do |init_position|
  describe "#when robot in #{init_position[:x]}, #{init_position[:y]} position" do
    it "ignores the MOVE instruction" do
      subject.place init_position[:x], init_position[:y], init_position[:direction]
      subject.move
      expect(subject.robot).to include init_position
    end
  end
end

#spec helper
def create_instruction_file(instructions)
  Tempfile.open('instruction') do |file|
    file.write instructions
    file.rewind
    yield(file)
  end
end
