REQUIRED_FIELDS = %w[byr iyr eyr hgt hcl ecl pid].freeze

documents = File.readlines('./day_4.in').each_with_object([[]]) do |line, users_data|
  if line.chomp.empty?
    users_data << []
  else
    data = line.split.map { |u| u.split(':').first }.flatten
    users_data.last.concat(data)
  end

  users_data
end

valid_documents = documents.select { |doc| (REQUIRED_FIELDS - doc).empty? }
puts(valid_documents.size)
