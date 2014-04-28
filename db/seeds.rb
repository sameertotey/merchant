# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

products = Product.create([{title: "Green Grapes (1 bunnch)", price: 2.00, 
  description: "1 bunch of approximately 80 green grapes", image_url: "green_grapes.jpg"  },
  {title: "Purple Grapes (1 bunch)", price: 2.25,
   description: "1 bunch of approximately 90 purple grapes", image_url: "purple_grapes.jpg"}])