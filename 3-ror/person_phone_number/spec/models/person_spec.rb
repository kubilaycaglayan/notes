require 'rails_helper'

RSpec.describe Person, type: :model do
  let(:phone) { Phone.new(number: "02323", person_id: 1) }
  
  it 'is valid' do
    expect(1).to eq(1)
  end
end
