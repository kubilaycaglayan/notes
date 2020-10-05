def full_counting_sort(array)
  counter = Array.new(100, 0)

  array.each do |mixed|
    number = mixed.to_i
    counter[number] += 1
  end

  result = Array.new(counter.sum, '')
  array.each do |mixed|
    integer_part = mixed.to_i
    string_part = mixed[2..-1].lstrip
    insert_index = counter[0..integer_part].sum - counter[integer_part]
    until result[insert_index] == '' || insert_index >= result.length - 1
      insert_index += 1
    end
    result[
      (
        insert_index
      )
      ] = string_part
  end
  result
end

p full_counting_sort(["0 ab", "6 cd", "0 ef", "6 gh", "4 ij", "0 ab", "6 cd", "0 ef", "6 gh", "0 ij", "4 that", "3 be", "0 to", "1 be", "5 question", "1 or", "2 not", "4 is", "2 to", "4 the"])
# => ["ab", "ef", "ab", "ef", "ij", "to", "be", "or", "not", "to", "be", "ij", "that", "is", "the", "question", "cd", "gh", "cd", "gh"]