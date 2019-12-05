passwords_range = (248345..746315)

def contains_double_digits?(password)
  contains_double_digits_regex = /(11|22|33|44|55|66|77|88|99|00)/

  password =~ contains_double_digits_regex
end

def not_decreasing?(password)
  number_not_decreasing_regex = /^1*2*3*4*5*6*7*8*9*$/

  password =~ number_not_decreasing_regex
end

def password_valid?(password)
  contains_double_digits?(password) && not_decreasing?(password)
end

def find_valid_passwords_count(passwords_range)
  valid_passwords_count = 0

  passwords_range.each do |password|
    valid_passwords_count += 1 if password_valid?(password.to_s)
  end

  valid_passwords_count
end

puts "Valid passwords: #{find_valid_passwords_count(passwords_range)}"
