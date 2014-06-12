require 'spec_helper'

describe 'Grid boundaries' do
  let(:instructions) {
    <<-EOF.gsub /^\s+/, ''
        PLACE 0,0,NORTH
        MOVE
        MOVE
        MOVE
        MOVE
        MOVE
        MOVE
        MOVE
        MOVE
        RIGHT
        MOVE
        MOVE
        MOVE
        MOVE
        MOVE
        MOVE
        RIGHT
        MOVE
        MOVE
        MOVE
        MOVE
        MOVE
        MOVE
        REPORT
    EOF
  }

  it "ignores any move that would cause the robot to be out of boundaries" do
    create_instruction_file(instructions) do |file|
      expect {
        CLI.start(['simulate_from_instruction_file', file.path])
      }.to output("0,5,SOUTH\n").to_stdout
    end
  end
end
