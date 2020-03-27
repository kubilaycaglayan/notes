is_list = Symbol.all_symbols.select do |item|
   item.to_s[0..2] == "is_"
end

#print Symbol.all_symbols
puts is_list