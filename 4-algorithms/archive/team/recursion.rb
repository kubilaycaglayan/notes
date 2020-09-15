def count_down(number)
  return if number < 0
  puts number
  count(number - 1)
end

count_down(-5)

# 3
# 2
# 1
# 0 => BASE CASE
#
# 10
# 9
# 8
# ...
# 0 => (BASE CASE)

def count_up(number)
  return if number < 0
  count_up(number - 1) # RECURSIVE CALL
  puts number
end

count_up(3)

0
1
2
3
