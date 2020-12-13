input = File.readlines('inputs/day_1.in').map(&:to_i)

found = [0, 0, 0]

input.each do |i|
  input.each do |j|
    input.each do |k|
      found = [i, j, k] if (i + j + k) == 2020
    end
  end
end

puts(found[0] * found[1] * found[2])
