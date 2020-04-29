def create_index_hash
  occurance = {}
  ('a'..'z').to_a.each do |letter|
    occurance[letter] = 0
  end
  occurance
end
puts create_index_hash
