class Guitar
  def benim_method
  end
end

my_guitar = Guitar.new

result = my_guitar.methods.to_a.map!(&:to_s).select do |item|
  true
end

print result