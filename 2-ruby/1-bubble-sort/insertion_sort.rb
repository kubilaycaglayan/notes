
numbers = [5,2,4,6,1,3]
numbers = (1..99).to_a.reverse

def insertion_sort array
    (array.length - 1).times do |i|
        while array[i+1] < array[i]
            array[i], array[i + 1] = array[i + 1], array[i]
            i -= 1 if i >= 1
        end
    end
    p array
end

insertion_sort numbers