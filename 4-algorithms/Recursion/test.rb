
def understanding_loop_returns
  (1..8).to_a.each do |element|
    return element if element > 3
  end
end

p understanding_loop_returns