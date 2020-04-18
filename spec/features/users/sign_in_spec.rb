require 'rails_helper'

feature "Sign in", type: :feature do
  before(:each) do
  	@user = create(:user)
  end

  scenario "access questionnaire with valid information" do
    visit root_path
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_button "Log in"
    expect(page).to have_content "Logout"
  end

  scenario "can not access with invalid information" do
    visit root_path
    fill_in "Email", with: @user.email
    fill_in "Password", with: "wrongpassword"
    click_button "Log in"
    expect(page).not_to have_content "Logout"
    expect(page).to have_content "Invalid Email or password."
  end  
	
end