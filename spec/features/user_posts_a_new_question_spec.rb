require 'rails_helper'

feature "posts a new question" do
 scenario "posts a new question" do

   visit new_question_path
   expect(page).to have_content("Post a Question")
 end
end
