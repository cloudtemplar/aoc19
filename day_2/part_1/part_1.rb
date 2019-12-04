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

  def call(position: 0)
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

  attr_accessor :output
end

inputs = File.read('input.txt').split(',').map { |i| i.chomp.to_i }

intcode_computer = IntcodeComputer.new(inputs)
intcode_computer.initialize_1202_program
intcode_computer.call

puts "Exit_value: #{intcode_computer.exit_value}"
