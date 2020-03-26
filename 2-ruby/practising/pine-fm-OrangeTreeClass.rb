class OrangeTree
    def initialize 
        puts "An orange tree has been seeded...".upcase
        @height = 0
        @age = 0
        @fruit_amount = 0
    end
    def age
        @age
    end
    def height
        @height 
    end
    def one_year_passes
        @age += 1
        if @age > (70 + rand(15))
            die
        end
        if @age < (40 + rand(20))
            (@height += (1+rand(2))) if @height < (40 + rand(50))
        end
        if @age > (5 + rand(5))
            @fruit_amount = (10 + @height * (1 + rand(1.1..1.5))).round(0)
        end
    end
    def die
        puts "The tree dies at #{@age} years old.".upcase
        exit
    end
    def fruit
        @fruit_amount
    end
    def pick_orange
        if @age > 5
            oranges_to_be_picked = (@fruit_amount / (2 + rand(5)).round(0))
            @fruit_amount -= oranges_to_be_picked
            puts "-picked oranges #{oranges_to_be_picked}"
            puts "-on the tree #{@fruit_amount} "
        end
    end  
end

my_tree = OrangeTree.new

2000.times do
    my_tree.one_year_passes
    if rand(4) == 1
        puts "#{my_tree.age} yo, #{my_tree.height} meters, has #{my_tree.fruit} fruits"
        my_tree.pick_orange if rand(3) == 1
        sleep 0.2
        3.times do
            print "."
            sleep 0.1
        end
    end
end
