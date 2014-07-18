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

RSpec.shared_examples 'an instruction' do |instruction_name, instruction , method_name, method_arguments|
  describe "when running #{instruction_name} instruction line" do
    let(:instruction_file_string) {
      <<-EOF.gsub /^\s+/, ''
          #{instruction}
      EOF
    }
    let(:instruction) { instruction }

    it "executes #{method_name} method in Simulator" do
      expect_to_receive = if method_arguments
                            receive(method_name).with(method_name)
                          else
                            receive(method_name).with(no_args())
                          end
      expect_any_instance_of(Simulator).to receive(method_name)
      create_instruction_file(instruction_file_string) do |file|
        CLI.start(['simulate_from_instruction_file', file.path])
      end
    end
  end
end

#spec helper
