require 'strscan'

def transpose(string)
  scn = StringScanner.new(string)
  new_string = ''
  until scn.eos?
    if word = scn.scan(/\w+/)
      letters = word.split('')
      if letters.each_cons(2).any? { |sub| sub == ['g','g'] }
        cache = ''
        letters.each do |letter|
          unless letter == 'g' || letter == 'n'
            new_string << switch_multiple_g_s_and_n_s(cache) unless cache.empty?
            cache = []
            new_string << letter 
          else
            cache << letter
          end
        end
        new_string << switch_multiple_g_s_and_n_s(cache) unless cache.empty?
      else
        new_string << switch_gn_with_ng(word)
      end
    else 
      new_string << scn.scan(/./)
    end
  end
  new_string
end

def switch_gn_with_ng(partial)
  partial.size.times do |index|
    partial[index..(index + 1)]
    partial[index..(index + 1)] = 'ng' if partial[index..(index + 1)] == 'gn'    
  end
  return partial
end

def switch_multiple_g_s_and_n_s(cache)
  multiples = ''
  multiples << 'n' * cache.count('n')
  multiples << 'g' * cache.count('g')
  multiples
end



puts transpose('he was searchign on Bign for signign kigns')
# => he was searching on Bing for singing kings

puts transpose('rignadingdiggn!')
# => ringadingdingg!

puts transpose('gngngnnggnngggnnn')
# => nnnnnnnnngggggggg