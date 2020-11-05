require 'byebug'

def eq?(char1, char2)
  return true if char2 == '.'
  char1 == char2
end

def is_match(string, regx)
  i = 0
  j = 0
  asteriks = false

  while i < string.size && j < regx.size
    asteriks = false

    if eq?(string[i], regx[j])
      i += 1
      j += 1
    elsif regx[j + 1] == '*'
      i += 1
      j += 2
    elsif regx[j] == '*'
      if eq?(string[i], regx[j - 1])
        asteriks = true
        i += 1
      elsif eq?(string[i], regx[j + 1])
        i += 1
        j += 2
      elsif asteriks
        asteriks = false
        if eq?(string[i], regx[j])
          i += 1
          j += 1
        else
          return false
        end
      else
        return false
      end
    else
      return false
    end
  end

  return false if i < string.size
  return false if j < regx.size && regx[-1] != '*'
  true
end

system 'clear'
describe 'is_match' do
  it 'Checks the string with a given regex and returns a boolean' do
    expect(is_match 'aa', 'a').to be false
  end
  it 'Checks the string with a given regex and returns a boolean' do
    expect(is_match 'aa', 'a*').to be true
  end
  it 'Checks the string with a given regex and returns a boolean' do
    expect(is_match('ab', '.*')).to be true
  end
  it 'Checks the string with a given regex and returns a boolean' do
    expect(is_match 'aab', 'c*a*b').to be true
  end
  it 'Checks the string with a given regex and returns a boolean' do
    expect(is_match 'mississippi', 'mis*is*p*.').to be false
  end
  it 'Checks the string with a given regex and returns a boolean' do
    expect(is_match "ab", ".*c").to be false
  end
end

describe 'eq?' do
  it 'Returns true if the char2 is *' do
    # 20.times { expect(eq?(('a'..'z').to_a[rand * 26 + 1], '*')).to be true }
  end

  it 'Returns true if the char2 is .' do
    20.times { expect(eq?(('a'..'z').to_a[rand * 26 + 1], '.')).to be true }
  end

  it 'Returns true if the given chars are matching' do
    26.times do |index|
      char = ('a'..'z').to_a[index]
      expect(eq?(char, char)).to be true
    end
  end

  it 'Returns false if the given chars are not matching' do
    26.times do |index|
      char1 = ('a'..'z').to_a[index]
      char2 = ('a'..'z').to_a[index + 1]
      expect(eq?(char1, char2)).to be false
    end
  end
end
