def repeatedString(string, repetition)
  units = []
  string.size.times do |index|
    units << string[index].downcase
  end
  count_in_unit = units.count('a')
  count_in_unit * (repetition / string.size) +
    units[0...(repetition % string.size)].count('a')
end

string = 'aaaaaaaaa'

repetition = 10

p repeatedString(string, repetition)
