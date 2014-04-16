require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the ReviewsHelper. For example:
#
# describe ReviewsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe ReviewsHelper do

  describe '#star_rating' do
  	context '0' do
  		it 'should return 5 empty stars' do
  			expect(star_rating(0)).to eq '☆☆☆☆☆'
  		end
  	end

  	context '1-4 stars' do
  		it 'returns 1 star for each point, the rest are empty' do
  			expect(star_rating(3)).to eq '★★★☆☆'
  		end
  	end

  	context '5 stars' do
  		it 'returns 5 filled stars' do
  			expect(star_rating(5)).to eq '★★★★★'
  		end
  	end

  	context 'float' do
  		it 'rounds to the nearest star' do
  			expect(star_rating(3.7)).to eq '★★★★☆'
  		end
  	end

  	context 'message given instead of numerical rating' do
  		it 'returns the message as-is' do
  			expect(star_rating('No reviews yet')).to eq 'No reviews yet'
  		end
  	end

  end

end
