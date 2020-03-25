esc = "This string has a quote: \". As you can see, it is \a escaped"

puts esc
puts "---"
puts "deneme1\a-" #bell, ASCII 07h (BEL)
puts "deneme2\b-" #backspace, ASCII 08h (BS)
puts "deneme3\t-" #horizontal tab, ASCII 09h (TAB)
puts "deneme4\n-" #newline (line feed), ASCII 0Ah (LF)
puts "deneme5\v-" #vertical tab, ASCII 0Bh (VT)
puts "deneme6\f-" #form feed, ASCII 0Ch (FF)
puts "deneme7\r-" #carriage return, ASCII 0Dh (CR)
puts "deneme8\e-" #escape, ASCII 1Bh (ESC)
puts "deneme9\s-" #space, ASCII 20h (SPC)
puts "deneme10\\-" #backslash, \