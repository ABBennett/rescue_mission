require 'rails_helper'

feature "sees questions" do
 scenario "see all the questions" do
   question = Question.create(name: "What's up?", description: "Not much")
   another_question = Question.create(name: "What's going on?", description: "Everything")

   visit questions_path
   expect(page).to have_content(question.name)
   expect(page).to have_content(another_question.name)
 end
end
