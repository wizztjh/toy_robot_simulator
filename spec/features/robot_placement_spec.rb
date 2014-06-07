require 'spec_helper'

describe "Robot placement" do

  let(:instructions) {
    <<-EOF.gsub /^\s+/, ""
        PLACE 1,2,NORTH
        REPORT
    EOF
  }

  it "places the robot in the location specified by the user" do
    create_instruction_file(instructions) do |file|
      expect {
        CLI.start(['simulate_from_instruction_file', file.path])
      }.to output("1,2,NORTH\n").to_stdout
    end
  end

end
