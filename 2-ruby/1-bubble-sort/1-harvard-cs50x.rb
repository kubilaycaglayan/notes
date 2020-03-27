def bubble_sort array
    length = array.length
    (length - 1).times do
        for i in 0...(length - 1)
            if array[i] > array[i+1]
                array[i], array[i+1] = array[i+1], array[i]
            end
        end
    end
    return array
end

def bubble_sort_opt_1 array
    length = array.length
    (length - 1).times do |n|
        for i in 0...(length - ( 1 + n ))
            if array[i] > array[i+1]
                array[i], array[i+1] = array[i+1], array[i]
                #print "opt-1 #{array}"
                #puts
            end
        end
    end
    return array
end

def bubble_sort_opt_2 array
    length = array.length
    (length - 1).times do |n|
        not_sorted = true
        for i in 0...(length - ( 1 + n ))
            if array[i] > array[i+1]
                array[i], array[i+1] = array[i+1], array[i]
                not_sorted = false
                #print "opt-2 #{array}"
                #puts
            end
        end
        return array if not_sorted
    end
    return array
end

def make_array n
    sort_this_array = []
    n.times do
        sort_this_array << rand(n*10)
    end
    sort_this_array.uniq
    main_array = sort_this_array
    $opt_0_mix = main_array.clone
    $opt_1_mix = main_array.clone
    $opt_2_mix = main_array.clone
end
make_array 1000

def profile description, &block
    start_time = Time.now
    block.call
    duration = ((Time.now - start_time)*1).to_s
    return description + duration + " seconds."
end

opt_0 = Proc.new do
    bubble_sort $opt_0_mix
    
end
opt_1 = Proc.new do
    bubble_sort_opt_1 $opt_1_mix
    
end
opt_2 = Proc.new do
    bubble_sort_opt_2 $opt_2_mix
    
end

puts profile 'opt-0-time: ', &opt_0
puts profile 'opt-1-time: ', &opt_1
puts profile 'opt-2-time: ', &opt_2