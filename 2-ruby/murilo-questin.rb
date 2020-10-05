# We are looking for a pair [n, 2n]

possible_pairs = []
(0..36).to_a.each do |number|
  possible_pairs << [number, 2 * number] if 2 * number <= 63
end

p possible_pairs

def double_exist?(arr)
  arr.sort.each do |number|
    next if number.even?

  end
end

double_exist?([15, 30, 45])

''