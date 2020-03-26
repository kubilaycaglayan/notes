arr = [[1,2,3],["a","b","c","d","e","f","g","h","i"]] 
# target = [[1,a,b,c],[2,d,e,f],[3,g,h,i]]

arr_result = []
n = 0

for i in 0..2
    arr_result << []
    arr_result[i].push(arr[0][i])
    for j in 1..3
        arr_result[i].push(arr[1][n])
        n += 1
    end
end

print arr_result