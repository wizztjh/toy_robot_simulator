require 'spec_helper'

describe Simulator do
  subject { described_class.new }

  describe '#place' do
    it 'places the robot' do
      subject.place 1, 2, 'NORTH'
      expect(subject.robot).to include x: 1, y: 2, direction: 'NORTH'
    end

    describe 'when x is not a number'
    describe 'when y is not a number'
    describe 'when direction is not valid'

    describe 'when place instruction run twice' do
      it 'still places the robot' do
        subject.place 1, 2, 'NORTH'
        subject.place 3, 3, 'SOUTH'
        expect(subject.robot).to include x: 3, y: 3, direction: 'SOUTH'
      end
    end
  end

  describe '#report' do
    it 'reports the location and direction of the robot' do
      subject.place 1, 2, 'NORTH'
      expect { subject.report }.to output("1,2,NORTH\n").to_stdout
    end

    describe 'when place instruction is not executed before' do
      it 'ignores the report instruction' do
        expect { subject.report }.to_not output.to_stdout
      end
    end
  end

  describe '#move' do

    describe 'moves the robot one grid to the direction' do
      it_behaves_like "a robot movement", "NORTH", x: 2, y: 3, direction: 'NORTH'
      it_behaves_like "a robot movement", "SOUTH", x: 2, y: 1, direction: 'SOUTH'
      it_behaves_like "a robot movement", "WEST", x: 1, y: 2, direction: 'WEST'
      it_behaves_like "a robot movement", "EAST", x: 3, y: 2, direction: 'EAST'
    end

    describe "when the next move is out of boundries" do
      describe 'when robot is facing west boundry' do
        (0..4).each do |y|
          it_behaves_like 'an out of boundries movement', x: 0, y: y, direction: "WEST"
        end
      end

      describe 'when robot is facing north boundry' do
        (0..4).each do |x|
          it_behaves_like 'an out of boundries movement', x: x, y: 4, direction: "NORTH"
        end
      end

      describe 'when robot is facing east boundry' do
        (0..4).each do |y|
          it_behaves_like 'an out of boundries movement', x: 4, y: y, direction: "EAST"
        end
      end

      describe 'when robot is facing south boundry' do
        (0..4).each do |x|
          it_behaves_like 'an out of boundries movement', x: x, y: 0, direction: "SOUTH"
        end
      end

      describe 'when place instruction is not executed before' do
        it 'ignores the report instruction' do
          expect { subject.move }.to_not change {subject.robot}
        end
      end

    end
  end

  shared_examples 'a robot rotation' do |origin_direction, expected_direction|
    describe "when the robot is facing #{origin_direction}" do
      it "rotates to #{expected_direction}" do
        subject.place 1, 1, origin_direction
        subject.send(rotation_method_name)
        expect(subject.robot[:direction]).to eq expected_direction
      end
    end
  end

  describe "#left" do
    let(:rotation_method_name) {"left"}
    it_behaves_like "a robot rotation", "NORTH", "WEST"
    it_behaves_like "a robot rotation", "WEST", "SOUTH"
    it_behaves_like "a robot rotation", "SOUTH", "EAST"
    it_behaves_like "a robot rotation", "EAST", "NORTH"

    describe 'when place instruction is not executed before' do
      it 'ignores the left instruction' do
        expect { subject.left }.to_not change {subject.robot}
      end
    end
  end

  describe "#right" do
    let(:rotation_method_name) {"right"}
    it_behaves_like "a robot rotation", "NORTH", "EAST"
    it_behaves_like "a robot rotation", "EAST", "SOUTH"
    it_behaves_like "a robot rotation", "SOUTH", "WEST"
    it_behaves_like "a robot rotation", "WEST", "NORTH"

    describe 'when place instruction is not executed before' do
      it 'ignores the right instruction' do
        expect { subject.right }.to_not change {subject.robot}
      end
    end
  end


end
