input = File.readlines('./day_3.in').map do |line|
  (line.chomp * 40).chars
end

row = 1
column = 3
trees = 0

loop do
  break if input[row].nil?

  if input[row][column] == '#'
    trees += 1
    input[row][column] = 'X'
  else
    input[row][column] = 'O'
  end

  row += 1
  column += 3
end

puts(trees)
