# Define a recursive function that takes an argument n and 
# prints "n bottles of beer on the wall", 
# "(n-1) bottles of beer on the wall", ..., 
# "no more bottles of beer on the wall".

def bottles(number)
  if number == 0
    puts 'No more bottles of beer on the wall.'
  else
    puts "#{number} bottles of beer on the wall."
    bottles(number - 1)
  end
end

bottles(3)