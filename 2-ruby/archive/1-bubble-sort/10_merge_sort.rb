numbers = [9,8,15,12,3,1]

def merge_sort array
    for i in (0..(array.length.to_f / 2).ceil).step(2)
        if array[i] > array[i+1]
            p i
            array[i], array[i+1] = array[i+1], array[i]
        end
    end
    p array
end

merge_sort numbers
