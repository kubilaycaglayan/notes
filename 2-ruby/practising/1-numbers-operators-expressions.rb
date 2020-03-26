puts 3.to_f / 2

(3..11).each do  #includes
    |x| print x
    print "\s"
end
puts

(3...11).each do  #includes
    |x| print x
    print "\s"
end
puts

Range.new(3,11).each do #another way of ranging
    |x| print x
    print "\s"
end
puts

puts 1 == 1  #relational operator

print " typically asks whether the thing on the right is a member or a part or a type of the thing on the left:\n"
puts (1..3) === 2
puts Integer === 3.2
puts /ell/ === 'Hello'