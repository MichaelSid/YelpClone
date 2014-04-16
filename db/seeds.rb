# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Restaurant.delete_all
Review.delete_all

bk = Restaurant.create(name: 'Burger King', category: 'Fast food', location: 'London')
gbk = Restaurant.create(name: 'GBK', category: 'Fast food', location: 'London')
Restaurant.create(name: 'Byron', category: 'Fast food', location: 'London')
cv = Restaurant.create(name: 'Chicken Village', category: 'Fast food', location: 'London')

bk.reviews.create(comment: 'OK', rating: 3)
gbk.reviews.create(comment: 'Great!', rating: 4)
cv.reviews.create(comment: 'Divine', rating: 5)

Review.create(comment: 'Ok', rating: 3, restaurant: bk)