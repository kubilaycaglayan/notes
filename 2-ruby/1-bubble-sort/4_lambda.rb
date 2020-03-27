add_water = lambda do |string|
  string + ' ..watered..'
end
puts add_water.call('plant')
puts %w[flower tree grass].map(&add_water)

def sun_rise(run_lambda)
  puts 'sun is rising up...'
  run_lambda.call
end
sun_rise(lambda do
  puts 'GREAT!!! sunflowers likes that!'
end)

add_three = lambda do |num|
  num + 3
end
print (10..50).step(10).to_a.map(&add_three)
