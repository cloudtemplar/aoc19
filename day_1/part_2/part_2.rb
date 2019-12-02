def modules_masses_from_file(path)
  File.foreach(path).map { |module_mass| module_mass.chomp.to_i }
end

def fuel_needed_for(mass, sum: 0)
  fuel_needed = (mass / 3.0).floor - 2
  return sum if fuel_needed <= 0
  sum += fuel_needed
  fuel_needed_for(fuel_needed, sum: sum)
end

def calculate_fuel_needed(masses)
  masses.inject(0) do |sum, module_mass|
    fuel_for_module = fuel_needed_for(module_mass)
    sum + fuel_for_module
  end
end

masses = modules_masses_from_file('input.txt')
total_fuel_needed = calculate_fuel_needed(masses)

puts "Total fuel needed: #{total_fuel_needed}"
