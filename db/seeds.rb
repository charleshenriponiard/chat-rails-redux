# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'drop all db'

Channel.delete_all
Message.delete_all

bordeaux = Channel.create!(name: "bordeaux")
paris = Channel.create!(name: "paris")
marseille = Channel.create!(name: "marseille")
bordeau = Channel.create!(name: "general")

puts "chanels created ! "