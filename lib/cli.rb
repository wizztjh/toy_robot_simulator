require 'thor'
require 'simulator'

class CLI < Thor
  desc 'simulate', 'read the file'
  def simulate_from_instruction_file(file_path)
    simulator = Simulator.new

    File.readlines(file_path).each do |instruction|
      command, *arguments = instruction.strip.split(/[\s|,]/)
      simulator.send(command.downcase, *arguments)
    end
  end
end

