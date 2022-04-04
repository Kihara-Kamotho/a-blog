require "rails_helper"

RSpec.feature "admin user can create new users" do
  # create an admin\
  let(:admin) {FactoryBot.create(:user, :admin)}

  before do
    login_as(admin)
    visit "/"
    click_link "Admin"
    click_link "Users"
    click_link "New User"
  end

  scenario "admin user can create new user" do
    fill_in "Email", with: "new-admin-user@example.com"
    fill_in "Password", with: "password"
    click_button "Create User"
    expect(page).to have_content "User has been created"
  end

  scenario "when a user is an admin" do
    fill_in "Email", with: "player-1@example.com"
    fill_in "Password", with: "password"
    check "Admin"
    click_button "Create User"
    expect(page).to have_content "User has been created"
  end
end
