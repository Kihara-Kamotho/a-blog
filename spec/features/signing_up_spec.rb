require "rails_helper"

RSpec.feature "Users can sign up" do
  scenario "when provided with valid attributes" do
    visit "/"
    click_link "Sign up"
    fill_in :Email, with: "tester@example.com"
    fill_in :Password, with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    expect(page).to have_content "Successfully signed up"
  end
end
