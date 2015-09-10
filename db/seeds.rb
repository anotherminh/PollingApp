# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


darth = User.create!(user_name: "Darth Vader")
luke = User.create!(user_name: "Luke Skywalker")
han = User.create!(user_name: "Han Solo")
leah = User.create!(user_name: "Leah")
storm = User.create!(user_name: "StormTr00per")

family_poll = Poll.create!(title: "Who are your Relatives?", author_id: luke.id)

question1 = Question.create!(question: "Who is Luke's father?", poll_id: family_poll.id)
question2 = Question.create!(question: "Who is Luke's sister?", poll_id: family_poll.id)

answerchoice1 = AnswerChoice.create!(question_id: question1.id, choice: "Han")
answerchoice2 = AnswerChoice.create!(question_id: question1.id, choice: "Darth Vader")
answerchoice3 = AnswerChoice.create!(question_id: question1.id, choice: "Storm Tr00per")

answerchoice4 = AnswerChoice.create!(question_id: question2.id, choice: "Leah")
answerchoice5 = AnswerChoice.create!(question_id: question2.id, choice: "StormTr00per")

response1 = Response.create!(answer_choice_id: answerchoice1.id, user_id: storm.id)
response2 = Response.create!(answer_choice_id: answerchoice2.id, user_id: darth.id)
response3 = Response.create!(answer_choice_id: answerchoice2.id, user_id: leah.id)
response4 = Response.create!(answer_choice_id: answerchoice2.id, user_id: han.id)

response5 = Response.create!(answer_choice_id: answerchoice4.id, user_id: han.id)
