# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.delete_all
Welcome.delete_all
category1 = Category.create!(name: 'Category 1')     # Kategoria numer 1
category2 = Category.create!(name: 'Category 2')     # Kategoria numer 2
category1.welcomes.create!(message: 'Hello World 1') # Pierwszy komunikat powitalny; przynależność: kategoria numer 1
category2.welcomes.create!(message: 'Hello World 2') # Drugi komunikat powitalny; przynależność: kategoria numer 2
category1.welcomes.create!(message: 'Hello World 3') # Trzeci komunikat powitalny; przynależność: kategoria numer 1
