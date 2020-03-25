class Student
    def initialize(name)
        @name = name
    end
    def greeting
        puts "Hi I am #{@name}."
    end
end

sema = Student.new("Sema")
ceyda = Student.new("Ceyda")
hande = Student.new("Hande")
sema.greeting
ceyda.greeting
hande.greeting

def instance_creator(name)
    name = Student.new(name.capitalize)
end

