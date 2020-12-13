def get_range_move(range, move)
  range_mid = range.size / 2
  lower_half = range.first(range_mid)
  upper_half = range.last(range_mid)

  moves = {
    lower: lower_half.first..lower_half.last,
    upper: upper_half.first..upper_half.last
  }

  moves[move]
end

boarding_passes = File.readlines('./day_5.in').map { |pass| pass.chomp.chars }

seat_ids = boarding_passes.map do |pass|
  row = pass[0..6].reduce(0..127) do |result, move|
    move == 'F' ? get_range_move(result, :lower) : get_range_move(result, :upper)
  end

  col = pass[7..9].reduce(0..7) do |result, move|
    move == 'L' ? get_range_move(result, :lower) : get_range_move(result, :upper)
  end

  (row.first * 8) + col.first
end

seat_ids = seat_ids.sort
seats = seat_ids.sort.map.with_index do |id, index|
  diff = seat_ids[index + 1] ? seat_ids[index + 1] - id : 1

  { diff: diff, id: id }
end

missing_seat = seats.select { |seat| seat[:diff] > 1 }

puts(missing_seat.first[:id] + 1)
