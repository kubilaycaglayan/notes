require 'rails_helper'

RSpec.describe Phone, type: :model do
  p Person.create(name: "This")
  let(:phone) { Phone.new(number: "02323", person_id: 1) }
  puts "__________ HERE ____________"
  p = Phone.new(number: "02323", person_id: 1)
  print p.save
  p p.errors
  p Person.all
  
  it 'is valid' do

    print phone.save.inspect
    
    expect(1).to eq(1)
  end
end
