require 'spec_helper'

describe 'Robot Rotation' do
  let(:instructions) {
    <<-EOF.gsub /^\s+/, ''
        PLACE 0,0,NORTH
        LEFT
        LEFT
        RIGHT
        LEFT
        REPORT
    EOF
  }

  it "rotate the robot counter clockwise with RIGHT comand and counter clockwise with LEFT comand" do
    create_instruction_file(instructions) do |file|
      expect {
        CLI.start(['simulate_from_instruction_file', file.path])
      }.to output("0,0,SOUTH\n").to_stdout
    end
  end

end
