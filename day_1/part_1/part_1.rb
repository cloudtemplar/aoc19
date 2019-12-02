module_masses = File.foreach('input.txt').map do |module_mass|
  module_mass.chomp.to_i
end

total_fuel_needed = module_masses.inject(0) do |sum, mass|
  fuel = (mass / 3.0).floor - 2
  sum + fuel
end

puts "Total fuel needed: #{total_fuel_needed}"
