puts
def print_objects_w_message(class_name, message)
  show = lambda do |object|
    p object
  end

  puts "___________#{message}___________"
  each_object = ObjectSpace.each_object(class_name, &show)
  puts
end

class Team
  attr_accessor :members
  def initialize(team_name)
    @team_name = team_name
    @members = []
  end

  def add_member(member)
    @members << member
  end
end

class Student
  attr_accessor :age
  def initialize(name, age)
    @name = name
    @age = age
  end
end

kubilay = Student.new('Kubilay', 29)
rose = Student.new('Rose', 22)
toafeek = Student.new('Toafeek', 22)
marios = Student.new('Marios', 22)
frank = Student.new('Frank', 22)
print_objects_w_message(Student, 'Show all instances of Student Class')

sandpipers = Team.new('Sandpipers')

sandpipers.add_member rose
print_objects_w_message(Team, 'Add Rose')

sandpipers.add_member toafeek
print_objects_w_message(Team, 'Add Toafeek')

sandpipers.add_member frank
sandpipers.add_member marios
sandpipers.add_member kubilay
print_objects_w_message(Team, 'Add all')

kubilay.age = 1001

print_objects_w_message(Team, 'Add all')






