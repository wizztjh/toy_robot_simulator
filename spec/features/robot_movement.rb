require 'spec_helper'

describe "Robot movement" do
  let(:instructions) {
    <<-EOF.gsub /^\s+/, ""
        PLACE 0,0,NORTH
        MOVE
        MOVE
        MOVE
        REPORT
    EOF
  }

  it "moves the robot" do
    create_instruction_file(instructions) do |file|
      expect {
        CLI.start(['simulate_from_instruction_file', file.path])
      }.to output("0,3,NORTH\n").to_stdout
    end
  end
end
