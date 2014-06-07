require 'spec_helper'

describe Simulator do
  subject { described_class.new }

  describe '#place' do
    it 'places the robot' do
      subject.place 1, 2, 'NORTH'
      expect(subject.robot).to include x: 1, y: 2, direction: 'NORTH'
    end

    describe "when x is not a number"
    describe "when y is not a number"
    describe "when direction is not valid"
  end

  describe "#report" do
    it 'reports the location and direction of the robot' do
      subject.place 1, 2, 'NORTH'
      expect { subject.report }.to output("1,2,NORTH\n").to_stdout
    end
  end

  shared_examples 'a robot movement' do |direction, expected_robot_status|
    describe "when robot is facing #{direction}" do
      before { subject.place 2, 2, direction }

      it "moves one grid to the #{direction}" do
        subject.move
        expect(subject.robot).to include expected_robot_status
      end

    end
  end

  describe "#move" do
    describe "moves the robot one grid to the direction" do

      it_behaves_like "a robot movement", "NORTH", x: 2, y: 3, direction: 'NORTH'
      it_behaves_like "a robot movement", "SOUTH", x: 2, y: 1, direction: 'SOUTH'
      it_behaves_like "a robot movement", "WEST", x: 1, y: 2, direction: 'WEST'
      it_behaves_like "a robot movement", "EAST", x: 3, y: 2, direction: 'EAST'

    end
  end

end
