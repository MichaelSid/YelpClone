class Restaurant < ActiveRecord::Base
	has_many :reviews
	validates :name, presence: true
	# validates :location, presence: true


	def average_score
		return 'No reviews' if reviews.none?

		reviews.average(:rating) #built-in Rails method. So we don't have to use the below inject method.

		# total_score = reviews.inject(0) do |total, review| 
		# 	total += review.rating
		# end
		# total_score / reviews.length	
	end
end
