require 'set'

questions = ('a'..'z').to_a.map { |q| [q, 0] }.to_h

groups = File.readlines('./day_6.in').each_with_object([[]]) do |line, groups_data|
  if line.chomp.empty?
    groups_data << []
  else
    groups_data.last.push(line.chomp)
  end

  groups_data
end

groups.each do |group|
  Set.new(group.reduce(&:concat).chars).each do |question|
    questions[question] += 1
  end
end

puts(questions.sum { |_, v| v })
