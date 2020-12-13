REQUIRED_FIELDS = %w[byr iyr eyr hgt hcl ecl pid].freeze
POSSIBLE_EYE_COLOR = %w[amb blu brn gry grn hzl oth].freeze

def valid_date?(date, min, max)
  date&.match?(/\d{4}/) && date.to_i.between?(min, max)
end

def valid_height?(height_field)
  height, unit = height_field.scan(/\d+|\D+/)

  return height.to_i.between?(150, 193) if unit == 'cm'
  return height.to_i.between?(59, 76) if unit == 'in'
end

def valid_document?(document)
  validations = [
    -> { (REQUIRED_FIELDS - document.keys).empty? },
    -> { POSSIBLE_EYE_COLOR.include?(document['ecl']) },
    -> { valid_date?(document['byr'], 1920, 2002) },
    -> { valid_date?(document['iyr'], 2010, 2020) },
    -> { valid_date?(document['eyr'], 2020, 2030) },
    -> { valid_height?(document['hgt']) },
    -> { document['hcl']&.match?(/^\#[0-9a-f]{6}$/) },
    -> { document['pid']&.match?(/^\d{9}$/) }
  ]

  validations.reduce(true) { |result, validation| result && validation.call }
end

documents = File.readlines('./day_4.in').each_with_object([{}]) do |line, users_data|
  if line.chomp.empty?
    users_data << {}
  else
    data = line.split.map { |u| u.split(':') }.to_h
    users_data.last.merge!(data)
  end

  users_data
end

valid_documents = documents.select { |doc| valid_document?(doc) }
puts(valid_documents.size)
