require 'spec_helper'

describe Simulator do
  subject { described_class.new }

  describe '#place' do
    it 'places the robot' do
      subject.place 1, 2, 'NORTH'
      expect(subject.robot).to include x: 1, y: 2, direction: 'NORTH'
    end
  end

  describe "#report" do
    it 'reports the location and direction of the robot' do
      subject.place 1, 2, 'NORTH'
      expect { subject.report }.to output("1,2,NORTH\n").to_stdout
    end
  end
end
