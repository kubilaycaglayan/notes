# https://www.geeksforgeeks.org/generating-all-possible-subsequences-using-recursion/?ref=rp

def printSubsequences(arr, index = 0, subarr = [], result = [])
  if index == arr.size
    result << subarr
  else
    printSubsequences(arr, index + 1, subarr, result)
    printSubsequences(arr, index + 1, subarr + [arr[index]], result)
  end
  result
end

arr = [1, 2, 3]

p printSubsequences(arr)
