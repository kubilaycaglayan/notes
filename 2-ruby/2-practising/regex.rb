text = 
<<~TITLE
Sabahlara akdar dayanamam osman aga
ben bugün çok mutluyum
12.01.2012 545
something.rb
  is there anybody out there?
TITLE


p "Do you like cats and dogs?" =~ /like/
puts "Do you like cats and dogs?".match(/like/)
def contains_vowel(str)
    p str =~ /[aeiou]/
end
contains_vowel("vowely")
contains_vowel("shhhh")

def contains(str, regexp)
    puts index = str =~ regexp
    puts str[index..-1]
end
contains("vowely", /o/)
contains(text, /\n\s/)
