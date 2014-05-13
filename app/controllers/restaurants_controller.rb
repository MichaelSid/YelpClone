class RestaurantsController < ApplicationController

	before_action :authenticate_user!, only: [:new, :create]
	
	def index
		@restaurants = Restaurant.all
	end

	def new
		@restaurant = Restaurant.new
	end



	def create
		@restaurant = Restaurant.new(restaurant_params)
		if @restaurant.save
			redirect_to '/restaurants'
		else
			
			render 'new'
			# different to 'redirect_to' because does not run 'new' action on line 7.
			# So only the view is displayed for 'new'. User does not lose all his inputs.
		end
	end

	def show
    @restaurant = Restaurant.find params[:id]
    @reviews = @restaurant.reviews
  end

	def edit
		@restaurant = Restaurant.find params[:id]
	end

	def update
		@restaurant = Restaurant.find params[:id]
		@restaurant.update restaurant_params
		flash[:notice] = 'Restaurant updated successfully!'
		redirect_to '/restaurants'
	end

	def destroy
		@restaurant = Restaurant.find params[:id]
		@restaurant.destroy

		flash[:notice] = 'Restaurant deleted successfully!'
		redirect_to '/restaurants'
	end

	
	private

	def restaurant_params
		params[:restaurant].permit(:name, :location, :category)
	end



end

