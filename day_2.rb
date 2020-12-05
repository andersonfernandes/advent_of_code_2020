def valid_password?(data)
  letter_x_present = data[:letter_x] == data[:letter]
  letter_y_present = data[:letter_y] == data[:letter]

  letter_x_present ^ letter_y_present
end

input = File.readlines('./day_2.in').map do |line|
  line_arr = line.split(' ')
  pos_x, pos_y = line_arr[0].split('-')
  password = line_arr[2]

  {
    letter: line_arr[1].delete(':'),
    letter_x: password[pos_x.to_i - 1],
    letter_y: password[pos_y.to_i - 1]
  }
end

valid_passwords = input.map { |data| valid_password?(data) }.count(true)
puts(valid_passwords)
