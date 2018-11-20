# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# before running rails db:seed MUST RUN: rails db:seed:seedcommunes
puts "Deleting existing records..."

User.destroy_all
Review.destroy_all
Search.destroy_all
Answer.destroy_all
Picture.destroy_all

c1 = Commune.where(zip_code: 1000).first
c2 = Commune.where(zip_code: 1050).first
c3 = Commune.where(zip_code: 1030).first
c4 = Commune.where(zip_code: 1040).first

puts "Creating new records..."

u1 = User.create!(email: "mikel@example.com", password: "123456", f_name: "Mikel", l_name:"C")
u2 = User.create!(email: "nhu@example.com", password: "123456", f_name: "Nhu", l_name:"T")
u3 = User.create!(email: "tarig@example.com", password: "123456", f_name: "Tarig", l_name:"B")
u4 = User.create!(email: "andrzej@example.com", password: "123456", f_name: "Andrzej", l_name:"G")

# in searches instances long/latit shhould be added by Geocoder gem while saving
s1 = Search.create!(address: "Cantersteen 12, 1000 Bruxelles", radius: 1.500, user: u1)
s2 = Search.create!(address: "Avenue de Tervueren, Etterbeek", radius: 5.000, user: u3)
s3 = Search.create!(address: "Grand-Place, Brussels", radius: 3.250, user: u2)
s4 = Search.create!(address: "Ambiorixsquare, 1000 Brussel", radius: 2.500, user: u2)



# in reviews instances long/latit shhould be added by Geocoder gem while saving
r1 = Review.create!(street_review_title: "Review No 1",
  street_review_content: "Excellet so nice!",
  street_review_average_rating: 6,
  commune_review_title: "Review on the commune No 1",
  commune_review_content: "Very nice commune indeed!",
  commune_review_average_rating: 5,
  no_likes: 2,
  user: u1,
  commune: c1,
  search: s1,
  address: s1.address
  )


r2 = Review.create!(street_review_title: "Review on the street No 2",
  street_review_content: "Very veyry excellent so nice!",
  street_review_average_rating: 4,
  commune_review_title: "Review on the commune No 2",
  commune_review_content: "Super very nice commune indeed!",
  commune_review_average_rating: 8,
  no_likes: 2,
  user: u1,
  commune: c1,
  search: s2,
  address: s2.address
  )

r3 = Review.create!(street_review_title: "Review on the street No 3",
  street_review_content: "Super cool and very very excellent so nice!",
  street_review_average_rating: 5,
  commune_review_title: "Review on the commune No 2",
  commune_review_content: "Super very nice commune indeed!",
  commune_review_average_rating: 2,
  no_likes: 2,
  user: u2,
  commune: c3,
  search: s3,
  address: s3.address
  )

r4 = Review.create!(street_review_title: "Review on the street No 4",
  street_review_content: "Oh my God, it's so cool. Very very excellent so nice!",
  street_review_average_rating: 9,
  commune_review_title: "Review on the commune No 2",
  commune_review_content: "Super very nice commune indeed!",
  commune_review_average_rating: 8,
  no_likes: 2,
  user: u3,
  commune: c2,
  search: s4,
  address: s4.address
  )



puts "Done populating the DB..."
