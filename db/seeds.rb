# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Article.destroy_all
i = 0
10.times do
  article = Article.new
  article.title = "\# " + Faker::Company.catch_phrase
  img = "![alt text](http://lorempixel.com/780/#{482+i}/ 'Logo Title Text 1')"
  intro = Faker::Lorem.words(50).join(" ") + "
  "
  link = " [" + Faker::Company.catch_phrase + "]" + "(" + Faker::Internet.url('example.com') + ") "
  important_word = "`" + Faker::Lorem.words(3).join(" ") + "`"
  first_para = "\#\#\#" + Faker::Company.catch_phrase + "\n" + Faker::Lorem.words(50).join(" ") + link + Faker::Lorem.words(50).join(" ") + "<br>"
  second_para = "\#\#\#" + Faker::Company.catch_phrase + "\n" + Faker::Lorem.words(50).join(" ") + important_word + Faker::Lorem.words(50).join(" ")
  article.content = ( intro + "\n" +img + "\n" + first_para + "\n" + second_para)
  article.save
  i += 1
end


