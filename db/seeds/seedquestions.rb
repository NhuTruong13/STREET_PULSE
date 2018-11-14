puts "Deleting existing questions..."

Question.destroy_all

puts "Creating questions..."

q1 = Question.create!(
  number: 1,
  title: "What is Question general appreciation of the commune?",
  category: "General",
  answer_type: "range"
  )

q2 = Question.create!(
  number: 2,
  title: "What is your general appreciation of the street?",
  category: "General",
  answer_type: "range"
  )

q3 = Question.create!(
  number: 3,
  title: "What are the top 3 best streets of your area?",
  category: "General",
  answer_type: "range"
  )

q4 = Question.create!(
  number: 4,
  title: "What are the worst 3 streets of your area?",
  category: "General",
  answer_type: "range"
  )


# ANSWERS TO Q5 (collection):
q5_answers = [
  "Singles",
  "Families with kids",
  "Retirees",
  "Tourists",
  "Students",
  "Offices/Professionals"
]

q5 = Question.create!(
  number: 5,
  title: "What kind of people live in your area?",
  category: "General",
  answer_type: "choice"
  )


# ANSWERS TO Q6 (collection):
q6_answers = [
  "Super high income",
  "High income",
  "Average income",
  "Low income",
]

q6 = Question.create!(
  number: 6,
  title: "How would you describe the income of people living in your area?",
  category: "General",
  answer_type: "choice"
  )

q7 = Question.create!(
  number: 7,
  title: "Are your neighbours friendly? (do you say HI to them? Do you know the name of some neighbours in your street? Do you have their phone numbers?",
  category: "Community / neighbours spirit",
  answer_type: "range"
  )

q8 = Question.create!(
  number: 8,
  title: "Are they lots of activities and community events?",
  category: "Community / neighbours spirit",
  answer_type: "range"
  )

q9 = Question.create!(
  number: 9,
  title: "Do you want to stay more than 5+ years in this area?",
  category: "Community / neighbours spirit",
  answer_type: "range"
  )

q10 = Question.create!(
  number: 10,
  title: "Is your neighbourhood a quiet place?",
  category: "Environment",
  answer_type: "range"
  )

q11 = Question.create!(
  number: 11,
  title: "Is your place green? In other words, are there lots of trees/parks in the area?",
  category: "Environment",
  answer_type: "range"
  )

q12 = Question.create!(
  number: 12,
  title: "Is your area clean in general?",
  category: "Environment",
  answer_type: "range"
  )

q13 = Question.create!(
  number: 13,
  title: "Is it easy to park?",
  category: "Facilities",
  answer_type: "range"
  )

q14 = Question.create!(
  number: 14,
  title: "Are there a lot of parking spots for cars?",
  category: "Facilities",
  answer_type: "range"
  )

q15 = Question.create!(
  number: 15,
  title: "Are there a lot of parking places for bikes?",
  category: "Facilities",
  answer_type: "range"
  )

q16 = Question.create!(
  number: 16,
  title: "Are they a lot of public transportation facilities? Ask to rate the tram / bus / metro / train",
  category: "Facilities",
  answer_type: "range"
  )

q17 = Question.create!(
  number: 17,
  title: "Are there a lot of bike lanes in the area?",
  category: "Facilities",
  answer_type: "range"
  )

q18 = Question.create!(
  number: 18,
  title: "Are the pavements well maintained?",
  category: "Comfort",
  answer_type: "range"
  )

q19 = Question.create!(
  number: 19,
  title: "Are the street well illuminated?",
  category: "Comfort",
  answer_type: "range"
  )

q20 = Question.create!(
  number: 20,
  title: "Are there nice playgrounds for the children?",
  category: "Comfort",
  answer_type: "range"
  )

q21 = Question.create!(
  number: 21,
  title: "Is the area dog friendly?",
  category: "Comfort",
  answer_type: "range"
  )


puts "Done creating questions in the DB..."

