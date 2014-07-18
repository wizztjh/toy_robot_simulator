require 'pry-byebug'
require 'tempfile'

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }

require 'cli'
require 'shared_examples'

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  config.order = 'random'
end

def create_instruction_file(instructions)
  Tempfile.open('instruction') do |file|
    file.write instructions
    file.rewind
    yield(file)
  end
end
