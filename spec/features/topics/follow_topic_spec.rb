require 'rails_helper'

feature 'Topic', type: :feature do
  let!(:topic) { create(:topic, name: "Health") }
  let!(:question) { create(:question, topic: topic) }
  let!(:user) { create(:user) }

  context "question detail" do
    let!(:answer) { create(:answer, question: question)}

    context "with answer" do
      scenario "follow topic with success" do
        signin_user(user, user.password)
        visit question_path(question)
        click_on "Follow Topic"

        expect(page).to have_content("You followed Health")
      end

      scenario "follow topic with alert" do
        signin_user(user, user.password)
        visit question_path(question)
        click_on "Follow Topic"
        visit question_path(question)
        click_on "Follow Topic"

        expect(page).to have_content("Already following")
      end

    end
  end

end