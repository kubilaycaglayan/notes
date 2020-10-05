def beers(num)
  (p 'no more bottles of beer on the wall') && return if num == 0
  p "#{num} bottles of beer on the wall"
  beers(num - 1)
end

beers 4

def bottles(n)
  if n == 0
    puts "no more bottles of beer on the wall"
  else
    puts "#{n} bottles of beer on the wall"
    bottles(n-1)
  end
end

bottles 5