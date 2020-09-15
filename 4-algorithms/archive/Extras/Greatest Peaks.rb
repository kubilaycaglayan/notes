def peaks(map)
  result = []
  map.each_with_index do |row, row_index|
    row.each_with_index do |value, column_index|
      check = []
      check << left = value > row[column_index - 1] unless column_index == 0
      check << right = value > row[column_index + 1] unless column_index == row.size - 1
      check << top = value > map[row_index - 1][column_index] unless  row_index == 0
      check << bottom = value > map[row_index + 1][column_index] unless  row_index == map.size - 1
      result << [row_index, column_index] if check.all? {|item| item == true}
    end
  end
  result
end

def greatest_peaks(map)
  peaks(map)
end

p greatest_peaks(
  [
    [9, 8, 5],
    [5, 6, 3],
    [8, 4, 1]
  ]
)
# => [3, 6]

p greatest_peaks(
  [
    [8, 12],
    [9, 3]
  ]
)
# => [1, 3]