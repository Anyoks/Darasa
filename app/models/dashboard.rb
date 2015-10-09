class Dashboard < ActiveRecord::Base
	include ActiveModel::Model # Enable the Dashboard to include the form_for helper method

	attr_reader :topic, :unit, :semester, :year, :course, :university

	# def create
	# 	@topic.save
	# 	@unit.save
	# 	@semester.save
	# 	@year.save
	# 	@course.save
	# 	@university.save		
	# end

	# def save_me
	# 	@topic = Topic.all
	# end



	# def save
	# 	set_password_for_user

	# 	if valid?
	# 		persist
	# 		true
	# 	else
	# 		false
	# 	end
	# end

	# def has_errors?
	# 	user.errors.any?
	# end

	# private

	# def valid?
	# 	user.valid?
	# end

	# def persist
	# 	user.save
	# 	@order = Order.create! user: user #now lets create a new order as we save the user

	# 	build_order_items
	# end

	# def set_password_for_user
	# 	user.password = Digest::SHA1.hexdigest(user.email + Time.now.to_s)[0..8] #creae a password using SHA1 Module with a digest using the first 8 characters of their email
	# end

	# def build_order_items
	# 	@cart.items.each do |item|
	# 		@order.order_items.create! product_id: item.product_id, quantity: item.quantity #this will run several times depending on the number of items in the cart
	# 	end
	# end


end
