# input:  grantsArray = [2, 100, 50, 120, 1000], newBudget = 190

# output: 47 # and given this cap the new grants array would be
           # [2, 47, 47, 47, 47]. Notice that the sum of the
           # new grants is indeed 190
require 'rspec'

def grantsArray(arr, new_budget)
	arr.sort.each_with_index do |num, index|
		if num * (arr.size - index) < new_budget
			new_budget -= num
		else
			return new_budget / (arr.size - index).to_f
		end
	end
end

describe 'grantsArray' do 
	it 'returns the cap' do
		expect(grantsArray([2, 100, 50, 120, 1000], 190)).to eq 47
	end
	
	it 'returns the cap' do
		expect(grantsArray([2,4], 3)).to eq 1.5
	end
	
	it 'returns the cap' do
		expect(grantsArray([2,4,6], 3)).to eq 1
	end

	it 'returns the cap' do
		expect(grantsArray([2,100,50,120,1000], 190)).to eq 47
	end

	it 'returns the cap' do
		expect(grantsArray([21,100,50,120,130,110], 140)).to eq 23.8
	end

	it 'returns the cap' do
		expect(grantsArray([210,200,150,193,130,110,209,342,117], 1530)).to eq 211
	end


end