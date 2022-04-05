require "rails_helper"

RSpec.feature "admin can archive user" do
  # admin & user bots
  let(:admin_user) { FactoryBot.create(:user, :admin) }
  let(:user) { FactoryBot.create(:user) }

  before do
    login_as(admin_user)
  end

  scenario "successfully" do
    visit admin_user_path(user)
    click_button "Archive User"

    expect(page).to have_content "User has been archived"
  end

  # admin cannot archive self
  scenario "cannot archive self" do
    visit admin_user_path(user)
    click_button "Archive User"

    expect(page).to have_content "You cannot archive yourself"
  end
end
