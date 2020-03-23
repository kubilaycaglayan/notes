def qu(msg="question?", ans="dummy")
    ask = true
    if ask
        puts msg.to_s
        not_answered = true
        while not_answered
            case @ans = gets.chomp
            when ""
                puts "Please give an answer"
            else
                not_answered = false
            end
        end
    else
        @ans = ans
    end
    return @ans
end

def little_quiz
    name = qu(msg="Adınız nedir?", ans="kuay").capitalize
    surname = qu(msg="Soyadınız nedir?", ans="Çağlayan").capitalize
    from = qu("What city are you from?", "Ankara").capitalize
    state = qu("What state are you from?", "Turkey").capitalize
    puts "Nice to meet you #{name}! So you are from #{from} in #{state}. And your surname is #{surname}! cool..."
end

def s_th
    text = qu("Please give me a text...", "This means war!")
    if (text.include? "s") || (text.include? "S")
        text.gsub!(/s/, "th")
        text.gsub!(/S/, "th")
        puts text
    else
        puts "There is no \"s\" in this text..."
    end
end

s_th
