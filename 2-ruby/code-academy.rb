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

def redactor
    text = qu("This is a word REDACTOR. Type the text you want it to be readacted...", "This is a text we are trying if our redactor works or not if it works then it works if it not works then it's not working")
    dodge_words = multiple_answer
    words = text.split(" ")
    dodge_words_upcased = dodge_words.map do |dodge|
        dodge.upcase
    end
    redacted_text = ""
    words.each do |word|
        if (dodge_words.include?(word)) || (dodge_words_upcased.include?(word.upcase))
            redacted_text << "**** "
        else
            redacted_text << "#{word} "
        end
    end
    puts redacted_text
end

def multiple_answer
    quantity_not_integer = true
    while quantity_not_integer
        quantity = qu("How many words you want to redact?(1-4)", "3").to_i
        if (1..4).include?(quantity)
            quantity_not_integer = false 
        end
    end
    counter = quantity
    answer_list = Array.new(quantity, "")
    while counter > 0
        answer_list[quantity-counter] = qu("Put the word you want to redact...", "workS")
        counter -= 1
    end
    return answer_list
end

def word_counter
    text = qu("Please put a text that you want to count the numbers of occurance of the words...", "asd asd Sample text text is is is")
    frequencies = Hash.new(0)
    words = text.split(" ")
    words.each do |word|
        frequencies[word] += 1
    end
    frequencies = frequencies.sort_by do |word, frequence|
        frequence
    end
    frequencies.reverse!
    frequencies.each do |word, frequence|
        puts "#{word}: #{frequence}"
    end
end

def sort_optional(arr, rev=false)
    if rev
        arr = arr.sort do |first, second|
            second <=> first
        end
    else
        arr = arr.sort do |first, second|
            first <=> second
        end
    end
    print arr
end

def imdb
    movies = { the_matrix: "10", son: "1" } 
    while true
        puts "___________________________"
        puts "What would you like to do?"
        puts "-- Type 'add' to add a movie."
        puts "-- Type 'update' to update a movie."
        puts "-- Type 'display' to display all movies."
        puts "-- Type 'delete' to delete a movie."
        request = qu("-- Type 'exit' to exit the program.", "display")
        case request
        when "add"
            add_movies(movies)
        when "update"
        update_movies(movies)
        when "display"
            display_movies(movies)
        when "delete"
            delete_movies(movies)
        when "exit"
            break
        else
            puts "Please make an appropriate choice..."
        end
    end

end

def add_movies(movies)
    new_movie = qu("Please type the name of the new movie...", "The Green Mile")
    if movies[new_movie.to_sym].nil?
        new_rating = qu("Please type the rating of #{new_movie}?", 11)
        movies[new_movie.to_sym] = new_rating
        puts "New movie added. #{new_movie} with a rating of #{movies[new_movie.to_sym]}"
    else
        puts "That movie already exist..."
    end
end

def update_movies(movies)
    movie_will_be_updated = qu("Please type the name of the movie that you want to update...", "the_matrix")
    if movies[movie_will_be_updated.to_sym].nil?
        puts "That movie doesn't exist"
    else
        new_rating = qu("Please enter the new rating...", 15)
        movies[movie_will_be_updated.to_sym] = new_rating
        puts "The movie #{movie_will_be_updated} is updated, new rating is #{movies[movie_will_be_updated.to_sym]}"
    end
end

def display_movies(movies)
    puts "These are your movies"
    movies.each do |movie, rating|
        puts "#{movie}: #{rating}"
    end
end

def delete_movies(movies)
    movie_will_be_deleted = qu("Please type the name of the movie that you want to delete...","son")
    if movies[movie_will_be_deleted.to_sym].nil?
        puts "Movie couldn't be found"
    else
        movies.delete(movie_will_be_deleted.to_sym)
        puts "Movie deleted (#{movie_will_be_deleted})"
        puts movies
    end
end

def first_n_primes
    require 'prime'
    while true
        n = qu("Please tell me how many prime numbers you would like to get?(between 1 and 99)", "5").to_i
        case n
        when 0
            next
        else
            break
        end
    end
    print Prime.first n
end

class Machine
    def initialize(username, password)
        @username = username
        @password = password
        @files = {}
        @@users[username] = password
        puts "#{@username} logged in."
    end
    @@users = {}
    def create_file(filename)
        now = Time.new.strftime("%Y-%m-%d %H:%M")
        @files[filename] = now
        puts "A new file created by #{@username} on #{now}"
        puts @files
    end
    def Machine.get_users
        return @@users
    end
    def update_file(filename, new_filename)
        @files[new_filename] = @files.delete(filename)
        puts "\"#{filename}\" is updated to \"#{new_filename}\"."
        puts @files
    end
    def delete_file(filename)
        @files.delete(filename)
        puts "\"#{filename}\" deleted by #{@username}"
        puts @files
    end
end
def run_machine
    my_computer = Machine.new("Kubilay", "abcd")
    my_computer.create_file("first file")
    my_computer.create_file("second file")
    my_computer.create_file("third file")
    my_computer.update_file("first file", "updated file")
    my_computer.delete_file("second file")
end

class Account
    def initialize(name, balance=100)
        @name = name
        @balance = balance
        puts "#{@name} opened an account with #{@balance} liras."
    end
    def display_balance(pin_number)
        if pin_number == pin
            puts "#{@name} has #{@balance} liras."
        else
            pin_error
        end
    end
    def withdraw(pin_number, amount)
        if pin_number == pin
            if @balance < amount
                puts "There's not that much money! Demand is #{amount} liras but #{@name} has #{@balance} liras."
            else
                @balance -= amount
                puts "Withdraw #{amount}. New balance is #{@balance}."
            end
        else
            pin_error
        end
    end
    def deposit(pin_number, amount)
        if pin_number == pin
            @balance += amount
            puts "#{@name} added #{amount} liras. New balance is #{@balance} liras."
        else
            pin_error
        end
    end
    private
    def pin
        @pin = 1234
    end
    def pin_error
        puts "Access denied: Wrong PIN..."
    end
    public
    def open
        name = qu("your name please...", "Jamilia")
        amount = qu("How much money you have?", 55)
        Account.new(name, amount)
    end
end
def run_account
    my_account = Account.new("Kubilay", 99)
    my_account.display_balance(1234)
    my_account.withdraw(1234, 12)
    my_account.deposit(1234,100)
    my_account.withdraw(1234, 189)
    my_account.withdraw(1234, 1)
end
#run_account
def liveAccount
    puts "You can: \n-open(opens a new account)\n-display\n-withdraw\n-deposit\n"
    selection = qu("What do you want to do?", "open")
    case qu
    when "open"
        Account.open
    when "display"
    when "withdraw"
    when "deposit"
    else
        puts "please make an appropriate selection"
    end
    while true

    end
end
liveAccount


class SavingAccount < Account
    def initialize(name, balance=0)
        @name = name
        @balance = balance
        puts "#{@name} opened a Saving Account with #{@balance} liras."
    end
end
def run_savingaccount
    my_account = SavingAccount.new("Kubilay", 99)
    my_account.display_balance(1234)
    my_account.withdraw(1234, 12)
    my_account.deposit(1234,100)
    my_account.withdraw(1234, 189)
    my_account.withdraw(1234, 1)
end
#run_savingaccount