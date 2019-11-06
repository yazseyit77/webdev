# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

developer = Developer.create(name: 'Yaz Seyid')
developer = Developer.create(name: 'Bill Gates')
developer = Developer.create(name: 'Steve Jobs')
client     = Client.create(name: 'Nury Aman')
client     = Client.create(name: 'Lara James')
client     = Client.create(name: 'Ashley Bryan')

developer.projects.create(client: client)