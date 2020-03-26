def do_until_false first_input, some_proc
  input = first_input
  output = first_input
  while output
    input = output
    output = some_proc.call input
  end
  p input
end
build_array_of_squares = Proc.new do |array|
  last_number = array.last
  if last_number <= 0
    false
  else
    array.pop
    array.push last_number ** 2
    array.push last_number - 1
  end
end
always_false = Proc.new do |ignore|
  false
end
#do_until_false [5], build_array_of_squares

def profile description, &block
  start_time = Time.now
  block.call
  duration = (Time.now - start_time)
  print description, duration, " seconds."
end
saved_block = Proc.new do
  10000000.times do
    2*2
  end
end
#profile 'How long this block will take?: ', &saved_block