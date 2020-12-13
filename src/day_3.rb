input = File.readlines('inputs/day_3.in').map do |line|
  (line.chomp * 100).chars
end

slopes = [
  [1, 1],
  [3, 1],
  [5, 1],
  [7, 1],
  [1, 2]
]

trees_per_slope = slopes.map do |right, down|
  row = down
  column = right
  trees = 0

  loop do
    break if input[row].nil?

    if input[row][column] == '#'
      trees += 1
      input[row][column] = 'X'
    else
      input[row][column] = 'O'
    end

    row += down
    column += right
  end

  trees
end

puts(trees_per_slope.reduce(&:*))
