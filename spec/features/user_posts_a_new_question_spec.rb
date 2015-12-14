require 'rails_helper'

feature "posts a new question" do
  scenario "posts an invalid question and sees error messages" do
    visit new_question_path
    expect(page).to have_content("Post a Question")
    fill_in('Name', :with => 'What am I doing?')

    click_button('Create Question')
    expect(page).to have_content("Description can't be blank")
    click_link("Back")

    expect(page).to have_content("Questions")
    expect(page).to have_no_content("What am I doing?")
  end

  scenario "posts a valid question and sees no error messages" do
    visit new_question_path
    expect(page).to have_content("Post a Question")
    fill_in('Name', :with => 'What am I doing?')
    fill_in('Description', :with => 'This is a description of a question.')

    click_button('Create Question')
    expect(page).to have_no_content("Name can't be blank")
    expect(page).to have_no_content("Description can't be blank")
  end

  scenario "posts a valid question and index page updates" do
    visit new_question_path
    expect(page).to have_content("Post a Question")
    fill_in('Name', :with => 'What am I doing?')
    fill_in('Description', :with => 'This is a description of a question.')
    click_button('Create Question')

    click_link("All Questions")
    expect(page).to have_content("Questions")
    expect(page).to have_content("What am I doing?")


  end


end
