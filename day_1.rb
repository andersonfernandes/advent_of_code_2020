input = File.readlines('./day_1.in').map(&:to_i)

found = []
input.each do |i|
  input.each do |j|
    found = [i, j] if (i + j) == 2020
  end
end

puts(found.first * found.last)
