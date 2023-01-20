require 'rails_helper'

describe "User signs in", type: :system do
  before do
    @user = create :user
    visit new_user_session_path
  end

  scenario "valid with correct credentials" do
    fill_in "user_email", with: @user.email
    fill_in "user_password", with: @user.password
    click_button "Log in"

    expect(page).to have_text "MediNotes"
    expect(page).to have_link "Logout"
    expect(page).to have_current_path root_path

    click_link "Logout"
    expect(page).to have_content "Signed out successfully."
    expect(page).to have_link "Sign in"
    expect(page).to have_link "Register"
    expect(page).to have_text "MediNotes"
    end



  scenario "invalid with unregistered account" do
    fill_in "user_email", with: Faker::Internet.email
    fill_in "user_password", with: "FakePassword123"
    click_button "Log in"

    expect(page).to have_no_link "Go to app"
    expect(page).to have_text "Invalid Email or password."
    expect(page).to have_no_link "Logout"
  end

  scenario "invalid with invalid password" do
    fill_in "user_email", with: @user.email
    fill_in "user_password", with: "FakePassword123"
    click_button "Log in"

    expect(page).to have_no_link "Go to app"
    expect(page).to have_text "Invalid Email or password."
    expect(page).to have_no_link "Logout"
  end
end