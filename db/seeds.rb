# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'open-uri'

Tour.all.each do |tour|
  image = tour.images.build
  image.title = 'Best tour'
  image.image = open('http://lorempixel.com/400/250/nightlife/')
  image.save(validate: false)
end

Article.all.each do |article|
  article.poster = open('http://lorempixel.com/400/250/nature/')
  article.save(validate: false)
end

Manager.all.each do |manager|
  manager.avatar = open('http://lorempixel.com/200/150/people/')
  manager.save(validate: false)
end

Country.all.each do |country|
  country.flag = open('http://lorempixel.com/25/25/city/')
  country.save(validate: false)
end

Contact.all.each do |contact|
  contact.logo = open('http://lorempixel.com/20/20/technics/')
end