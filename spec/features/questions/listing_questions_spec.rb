require 'rails_helper'

feature "Questions", type: :feature do
  let!(:questions) { 3.times { |i| create(:question, title: "Question #{i+1}") } }
  let!(:user) { create(:user) }

  it 'listing of questions' do
  	signin_user(user, user.password)
  	expect(page).to have_content "Question 1"
  	expect(page).to have_content "Question 2"
  	expect(page).to have_content "Question 3"
  	expect(page).not_to have_content "Question 4"
  end

end