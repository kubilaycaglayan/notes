require './7-stack.rb'

def balanced_brackets?(string)
  stack = Stack.new

  string.split("").each do |character|
    case character
    when '('
      stack.push('(')
    when ')'
      return false unless stack.pop == '('
    when '['
      stack.push('[')
    when ']'
      return false unless stack.pop == '['
    when '{'
      stack.push('{')
    when '}'
      return false unless stack.pop == '{'
    end
  end
  
  return false unless stack.empty?
  return true
end

puts balanced_brackets?('(hello)[world]')
# => true

puts balanced_brackets?('([)]')
# => false

puts balanced_brackets?('[({}{}{})([])]')
# => true