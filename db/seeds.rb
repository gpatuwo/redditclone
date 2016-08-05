# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username: "grace", password: "asdfasdf")
User.create(username: "sara", password: "asdfasdf")

Sub.create(title: "Cats", description: "fluffy kittens!", moderator_id: 1)
Sub.create(title: "Dogs", description: "cute canines!", moderator_id: 2)
