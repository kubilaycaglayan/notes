result = (1..100).select do |number|
    number.to_s[-1] == "0"
end.map do |number|
   number + 1 
end

print result