require "rails_helper"

RSpec.feature "Admin can edit user details" do
  # user bots
  let(:admin_user) { FactoryBot.create(:user, :admin) }
  let(:user) { FactoryBot.create(:user) }

  before do
    login_as(admin_user)
    visit admin_user_path(user)
    click_link "Edit User"
  end

  scenario "with valid attributes" do
    fill_in "Email", with: "new-guy@example.com"
    click_button "Update User"

    expect(page).to have_content "User has been updated"
  end

  scenario "can toggle admin value" do
    check "Admin"
    click_button "Update User"

    expect(page).to have_content "User has been updated"
  end
end
