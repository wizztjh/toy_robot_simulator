require 'spec_helper'

describe CLI do
  describe '#simulate_from_instruction_file' do

    it_behaves_like 'an instruction', 'PLACE', 'PLACE 2,3,SOUTH', :place, [1,2, 'SOUTH']
    it_behaves_like 'an instruction', 'REPORT', 'REPORT', :report
    it_behaves_like 'an instruction', 'LEFT', 'LEFT', :left
    it_behaves_like 'an instruction', 'RIGHT', 'RIGHT', :right
    it_behaves_like 'an instruction', 'MOVE', 'MOVE', :move

  end
end
