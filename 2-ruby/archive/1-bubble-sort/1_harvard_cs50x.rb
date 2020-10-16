def bubble_sort(array)
  length = array.length
  (length - 1).times do
    (0...(length - 1)).each do |i|
      array[i], array[i + 1] = array[i + 1], array[i] if array[i] > array[i + 1]
    end
  end
  array
end

def bubble_sort_opt_1(array)
  length = array.length
  (length - 1).times do |num|
    (0...(length - (1 + num))).each do |i|
      next unless array[i] > array[i + 1]

      array[i], array[i + 1] = array[i + 1], array[i]
      # print "opt_1 #{array}"
      # puts
    end
  end
  array
end

def bubble_sort_opt_2(array)
  length = array.length
  (length - 1).times do |num|
    not_sorted = true
    (0...(length - (1 + num))).each do |i|
      next unless array[i] > array[i + 1]

      array[i], array[i + 1] = array[i + 1], array[i]
      not_sorted = false
      # print "opt_2 #{array}"
      # puts
    end
    return array if not_sorted
  end
  array
end

def insertion_sort array
  (array.length - 1).times do |i|
      while array[i+1] < array[i]
          array[i], array[i + 1] = array[i + 1], array[i]
          i -= 1 if i >= 1
      end
  end
  array
end

def make_array(num)
  sort_this_array = []
  num.times do
    sort_this_array << rand(num * 10)
  end
  sort_this_array.uniq!
end

main_array = make_array 10000
opt_0_mix = main_array.clone
opt_1_mix = main_array.clone
opt_2_mix = main_array.clone
ins_s_mix = main_array.clone

def profile(description, &block)
  start_time = Time.now
  block.call
  duration = ((Time.now - start_time) * 1)
  duration = duration.round(2) if duration > 1
  description + duration.to_s + ' seconds.'
end

opt0 = proc do
  bubble_sort opt_0_mix
end
opt1 = proc do
  bubble_sort_opt_1 opt_1_mix
end
opt2 = proc do
  bubble_sort_opt_2 opt_2_mix
end
ins = proc do
  insertion_sort ins_s_mix
end

puts profile 'ins_s-time: ', &ins   #  9 seconds
puts profile 'opt_2-time: ', &opt2  # 14 seconds
puts profile 'opt_1-time: ', &opt1  # 16 seconds
puts profile 'opt_0-time: ', &opt0  # 24 seconds

#changes for commit trials
#changes for commit trials 2