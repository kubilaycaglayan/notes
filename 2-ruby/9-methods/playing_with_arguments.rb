
def playing_with_arguments(a = {value: nil})
  return false if a.nil?
  begin
    return true if a[:value].nil?
  rescue => exception
    return a
  end
end

p playing_with_arguments(nil)
p playing_with_arguments
p playing_with_arguments(5)