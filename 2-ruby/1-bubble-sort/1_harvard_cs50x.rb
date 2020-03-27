def bubble_sort(array)
  length = array.length
  (length - 1).times do
    (0...(length - 1)).each do |i|
      array[i], array[i + 1] = array[i + 1], array[i] if array[i] > array[i + 1]
    end
  end
  array
end

def bubble_sort_opt-1(array)
  length = array.length
  (length - 1).times do |n|
    (0...(length - (1 + n))).each do |i|
      next unless array[i] > array[i + 1]

      array[i], array[i + 1] = array[i + 1], array[i]
      # print "opt-1 #{array}"
      # puts
    end
  end
  array
end

def bubble_sort_opt-2(array)
  length = array.length
  (length - 1).times do |n|
    not_sorted = true
    (0...(length - (1 + n))).each do |i|
      next unless array[i] > array[i + 1]

      array[i], array[i + 1] = array[i + 1], array[i]
      not_sorted = false
      # print "opt-2 #{array}"
      # puts
    end
    return array if not_sorted
  end
  array
end

def make_array(n)
  sort_this_array = []
  n.times do
    sort_this_array << rand(n * 10)
  end
  sort_this_array.uniq!
  main_array = sort_this_array
  $opt-0_mix = main_array.clone
  $opt-1_mix = main_array.clone
  $opt-2_mix = main_array.clone
end
make_array 1000

def profile(description, &block)
  start_time = Time.now
  block.call
  duration = ((Time.now - start_time) * 1).to_s
  description + duration + ' seconds.'
end

opt-0 = proc do
  bubble_sort $opt-0_mix
end
opt-1 = proc do
  bubble_sort_opt-1 $opt-1_mix
end
opt-2 = proc do
  bubble_sort_opt-2 $opt-2_mix
end

puts profile 'opt-0-time: ', &opt-0
puts profile 'opt-1-time: ', &opt-1
puts profile 'opt-2-time: ', &opt-2
