require 'rails_helper'

RSpec.describe "questions/index", type: :view do
 before(:each) do
   assign(:questions, [
     Question.create!(
       :name => "What is Love?",
       :description => "this is a description"
     ),
     Question.create!(
       :name => "Why is Love?",
       :description => "this is a description"
     )
   ])
 end

 it "renders a list of questions" do

   render
   expect(rendered).to have_content "What is Love?"
   expect(rendered).to have_content "Why is Love?"
 end
end
