require "rails_helper"

RSpec.feature "Users can log in to their existing accounts" do

  let!(:user) { FactoryBot.create(:user)}

  scenario "with valid attributes" do
  visit "/"
  click_link "Sign in"
  fill_in "Email", with: user.email
  fill_in "Password", with: "Password"
  click_link "Sign in"

  expect(page).to have_content "Successfully signed in"
  expect(page).to have_content "#{user.email}"
  end

  scenario "unless they are archived" do
    # archived user cannot sign in
    user.archive!

    visit "/"
    click_link "Sign in"
    fill_in "Email", with: user.email
    fill_in "Password", with: "Password"
    click_link "Sign in"

    expect(page).to have_content "Your account has been archived"
  end
end
