require 'pry'

class IntcodeComputer
  def initialize(input)
    @input = input
    @output = input.clone
  end

  def exit_value
    output[0]
  end

  def apply_opcodes(position: 0)
    loop do
      instruction = output[position]

      case instruction
      when 1
        value = output[output[position + 1]] + output[output[position + 2]]
        write_to = output[position + 3]
        output[write_to] = value
      when 2
        value = output[output[position + 1]] * output[output[position + 2]]
        write_to = output[position + 3]
        output[write_to] = value
      when 99
        return output
      end

      position += 4
    end
  end

  private

  attr_reader :input
  attr_accessor :output

  def clear_memory
    self.output = input
  end
end

input = File.read('input.txt').split(',').map { |i| i.chomp.to_i }

intcode_computer = IntcodeComputer.new(input)
p intcode_computer.apply_opcodes
p intcode_computer.exit_value
