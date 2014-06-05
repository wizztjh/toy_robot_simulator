require 'spec_helper'

describe "Robot placement" do
  it "places the robot in the location specified by the user" do
    Tempfile.open('instruction') do |file|
      file.write <<-EOF.gsub /^\s+/, ""
        PLACE 1,2,NORTH
        REPORT
      EOF
      file.rewind

      expect {
        CLI.start(['simulate_from_instruction_file', file.path])
      }.to output("1,2,NORTH\n").to_stdout

    end
  end
end
