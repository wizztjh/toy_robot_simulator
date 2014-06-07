require 'spec_helper'

describe "Robot movement" do
  it "moves the robot" do
    Tempfile.open('instruction') do |file|
      file.write <<-EOF.gsub /^\s+/, ""
        PLACE 0,0,NORTH
        MOVE
        MOVE
        MOVE
        REPORT
      EOF
      file.rewind

      expect {
        CLI.start(['simulate_from_instruction_file', file.path])
      }.to output("0,3,NORTH\n").to_stdout

    end
  end
end
