# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Deleting existing records..."

User.destroy_all
Review.destroy_all
Search.destroy_all
Answer.destroy_all
Question.destroy_all
Picture.destroy_all
Commune.destroy_all

puts "Creating new records..."

u1 = User.create!(email: "mikel@example.com", password: "123456", f_name: "Mikel", l_name:"C")
u2 = User.create!(email: "nhu@example.com", password: "123456", f_name: "Nhu", l_name:"T")
u3 = User.create!(email: "tarig@example.com", password: "123456", f_name: "Tarig", l_name:"B")
u4 = User.create!(email: "andrzej@example.com", password: "123456", f_name: "Andrzej", l_name:"G")


c1 = Commune.create!(name: "Woluwe", description: "Lorem ipsum dolor sit amet", zip_code: 1200)
c2 = Commune.create!(name: "Ixelles", description: "Lorem ipsum dolor sit amet", zip_code: 1050)
c3 = Commune.create!(name: "Uccle", description: "Lorem ipsum dolor sit amet", zip_code: 1080)
c4 = Commune.create!(name: "Etterbeek", description: "Lorem ipsum dolor sit amet", zip_code: 1040)

s1 = Search.create!(address: "Be Central 10, Bruxelles", radius: 100, latitude: 50.9455, longitude: 4.95, user: u1, commune: c1)
s2 = Search.create!(address: "Grand Place 1, Bruxelles", radius: 200, latitude: 50.5455, longitude: 4.55, user: u3, commune: c2)
s3 = Search.create!(address: "Ave de Tervuren, Bruxelles", radius: 250, latitude: 50.2455, longitude: 4.25, user: u2, commune: c3)


q1 = Question.create!(title: "How friendly are the neighbours?", category: "friendliness", answer_type: "type01")
q2 = Question.create!(title: "How wealthy are your neighbours?", category: "wealth", answer_type: "type01")
q3 = Question.create!(title: "What are the 3 best strees in your neighbourhood?", category: "category2", answer_type: "type02")
q4 = Question.create!(title: "Are there a lot of activities in the hood?", category: "category3", answer_type: "type01")


r1 = Review.create!(street_review_title: "Review No 1",
  street_review_content: "Excellet so nice!",
  street_review_average_rating: 6,
  commune_review_title: "Review on the commune No 1",
  commune_review_content: "Very nice commune indeed!",
  commune_review_average_rating: 5,
  latitude_review: 50.8424,
  longitude_review: 4.345,
  no_likes: 2,
  user: u1,
  commune: c1,
  search: s1
  )


r2 = Review.create!(street_review_title: "Review on the street No 2",
  street_review_content: "Very veyry excellent so nice!",
  street_review_average_rating: 4,
  commune_review_title: "Review on the commune No 2",
  commune_review_content: "Super very nice commune indeed!",
  commune_review_average_rating: 8,
  latitude_review: 51.8424,
  longitude_review: 4.9,
  no_likes: 2,
  user: u1,
  commune: c1,
  search: s2
  )

r3 = Review.create!(street_review_title: "Review on the street No 3",
  street_review_content: "Super cool and very very excellent so nice!",
        street_review_average_rating: 5,
      commune_review_title: "Review on the commune No 2",
  commune_review_content: "Super very nice commune indeed!",
commune_review_average_rating: 2,
latitude_review: 51.8424,
      longitude_review: 4.9,
      no_likes: 2,
  user: u2,
  commune: c3,
  search: s3
  )

r4 = Review.create!(street_review_title: "Review on the street No 4",
  street_review_content: "Oh my God, it's so cool. Very very excellent so nice!",
  street_review_average_rating: 9,
  commune_review_title: "Review on the commune No 2",
  commune_review_content: "Super very nice commune indeed!",
  commune_review_average_rating: 8,
  latitude_review: 51.8424,
  longitude_review: 4.9,
  no_likes: 2,
  user: u3,
  commune: c2,
  search: s2
  )

a1 = Answer.create!(answer_text: nil, answer_range: 5, question: q1, review: r1)
a2 = Answer.create!(answer_text: "Very wealthy", answer_range: nil, question: q2, review: r2)
a3 = Answer.create!(answer_text: nil, answer_range: 7, question: q3, review: r3)
a4 = Answer.create!(answer_text: "Very wealthy", answer_range: nil, question: q4, review: r4)


puts "Done populating the DB..."

