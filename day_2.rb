def valid_password?(data)
  letter_count = data[:password].count(data[:letter])

  letter_count >= data[:min] && letter_count <= data[:max]
end

input = File.readlines('./day_2.in').map do |line|
  line_arr = line.split(' ')
  min, max = line_arr[0].split('-')

  {
    letter: line_arr[1].delete(':'),
    min: min.to_i,
    max: max.to_i,
    password: line_arr[2]
  }
end

valid_passwords = input.map { |data| valid_password?(data) }.count(true)
puts(valid_passwords)
