p "Do you like cats and dogs?" =~ /like/
puts "Do you like cats and dogs?".match(/like/)
def contains_vowel(str)
    p str =~ /[aeiou]/
end
contains_vowel("vowely")
contains_vowel("shhhh")

