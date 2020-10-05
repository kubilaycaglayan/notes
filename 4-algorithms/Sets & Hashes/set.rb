require 'set'
class Invoice
  attr_reader :id
  def initialize(id, name)
    @id = id
    @name = name
  end
end

in1 = Invoice.new(123, 'Süpürge')
in2 = Invoice.new(124, 'Tv')
in3 = Invoice.new(123, 'Süpürge')

my_set = Set.new [in1.id, in2.id, in3.id, in1.id]

my_second_set = Set.new [123]

p my_set, my_second_set, my_set.superset?(my_second_set)