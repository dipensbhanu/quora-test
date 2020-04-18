require 'rails_helper'

feature 'User', type: :feature do
  let!(:creator) { create(:user, name: "Test User 1") }
  let!(:question) { create(:question, user: creator) }
  let!(:user) { create(:user) }

  context "question detail" do
    let!(:answer) { create(:answer, question: question)}

    context "with answer" do
      scenario "follow user with success" do
        signin_user(user, user.password)
        visit question_path(question)
        click_on "Follow User"

        expect(page).to have_content("You followed")
      end

      scenario "follow user with alert" do
        signin_user(user, user.password)
        visit question_path(question)
        click_on "Follow User"
        visit question_path(question)
        click_on "Follow User"

        expect(page).to have_content("Already following")
      end

    end
  end

end