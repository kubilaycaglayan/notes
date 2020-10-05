require_relative './stack'

def balanced_brackets?(string)
  brackets = Stack.new

  string.split('').each do |letter|
    case letter
    when '['
      brackets.push(letter)
    when '('
      brackets.push(letter)
    when '{'
      brackets.push(letter)
    when ']'
      return false if brackets.empty? || brackets.pop != '['
    when ')'
      return false if brackets.empty? || brackets.pop != '('
    when '}'
      return false if brackets.empty? || brackets.pop != '{'
    end
  end
  return false unless brackets.empty?

  true
end

p balanced_brackets?('(hello)[world]')
# => true

p balanced_brackets?('([)]')
# => false

p balanced_brackets?('[({}{}{})([])]')
# => true

p balanced_brackets?(')(')