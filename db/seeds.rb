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

c1 = Commune.create!(name: "Woluwe", description: "Lorem ipsum dolor sit amet", zip_code: 1200)
c1 = Commune.create!(name: "Ixelles", description: "Lorem ipsum dolor sit amet", zip_code: 1050)

s1 = Search.create!(address: "Be Central 10, Bruxelles", radius: 100, latitude: 50.8455, longitude: 4.35, user: u1, commune: c1)
s2 = Search.create!(address: "Grand Place 1, Bruxelles", radius: 100, latitude: 50.8455, longitude: 4.35, user: u1, commune: c1)

q1 = Question.create!(title: "How friendly are the neighbours?", category: "friendliness", answer_type: "type01")
q2 = Question.create!(title: "How wealty are your neighbours?", category: "wealth", answer_type: "type01")


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
  street_review_content: "Very veyry excellet so nice!",
  street_review_average_rating: 6,
  commune_review_title: "Review on the commune No 2",
  commune_review_content: "Super very nice commune indeed!",
  commune_review_average_rating: 3,
  latitude_review: 51.8424,
  longitude_review: 4.9,
  no_likes: 2,
  user: u1,
  commune: c1,
  search: s1
)

a1 = Answer.create!(answer_text: nil, answer_range: 5, question: q1, review: r1)
a2 = Answer.create!(answer_text: "Very wealthy", answer_range: nil, question: q2, review: r2)

puts "Done populating the DB..."

