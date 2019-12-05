class IntcodeComputer
  def initialize(inputs)
    @output = inputs.dup
  end

  def initialize_1202_program
    output[1] = 12
    output[2] = 2
  end

  def exit_value
    output[0]
  end

  def read_value_from_position(position)
    output[output[position]]
  end

  def write_value_to_position(position, value)
    output[output[position]] = value
  end

  def call(pointer: 0)
    loop do
      instruction = output[pointer]

      case instruction
      when 1
        value = read_value_from_position(pointer + 1) + read_value_from_position(pointer + 2)
        write_value_to_position(pointer + 3, value)
      when 2
        value = read_value_from_position(pointer + 1) * read_value_from_position(pointer + 2)
        write_value_to_position(pointer + 3, value)
      when 99
        return output
      end

      pointer += 4
    end
  end

  private

  attr_accessor :output
end

inputs = File.read('input.txt').split(',').map { |i| i.chomp.to_i }

intcode_computer = IntcodeComputer.new(inputs)
intcode_computer.initialize_1202_program
intcode_computer.call

puts "Exit_value: #{intcode_computer.exit_value}"
