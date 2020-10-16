starting_with_filter = lambda do |word, letter|
  return word[0...(letter.length)] == letter
end
words = %w[ever everyone ever nose noise pen pencil house]
def filter_this(array, letter)
  puts "let's filter"
  filtered_words = array.select do |word|
    yield(word, letter)
  end
  print filtered_words
end

filter_this words, 'pen', &starting_with_filter
