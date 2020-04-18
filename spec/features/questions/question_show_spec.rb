require 'rails_helper'

feature 'Question Detail', type: :feature do
  let!(:question) { create(:question, title: "Question First") }
  let!(:user) { create(:user) }

  context "question detail" do
    context "with answer" do
      let!(:answer) { create(:answer, question: question)}
      scenario "success" do
        signin_user(user, user.password)
        click_on "Question First"

        expect(page).to have_content("Question First")
        expect(page).to have_content("Answered by:")
        expect(page).to have_content("Follow User")
        expect(page).to have_content("Follow Topic")
      end
    end

    context "without answer" do
      scenario "success" do
        signin_user(user, user.password)
        click_on "Question First"

        expect(page).to have_content("Question First")
        expect(page).not_to have_content("Answered by:")
        expect(page).not_to have_content("Follow User")
        expect(page).not_to have_content("Follow Topic")
      end
    end

  end

end