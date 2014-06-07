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

  describe "#move" do
    describe "moves the robot one grid to the direction" do
      before { subject.place 2, 2, direction }

      describe 'when robot is facing north' do
        let(:direction) {'NORTH'}
        it 'moves one grid to the north' do
          subject.move
          expect(subject.robot).to include x: 2, y: 3, direction: 'NORTH'
        end
      end

      describe 'when robot is facing south' do
        let(:direction) {'SOUTH'}
        it 'moves one grid to the south' do
          subject.move
          expect(subject.robot).to include x: 2, y: 1, direction: 'SOUTH'
        end
      end

      describe 'when robot is facing west' do
        let(:direction) {'WEST'}
        it 'moves one grid to the west' do
          subject.move
          expect(subject.robot).to include x: 1, y: 2, direction: 'WEST'
        end
      end

      describe 'when robot is facing east' do
        let(:direction) {'EAST'}
        it 'moves one grid to the east' do
          subject.move
          expect(subject.robot).to include x: 3, y: 2, direction: 'EAST'
        end
      end

    end
  end

end
