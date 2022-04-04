require "rails_helper"

RSpec.feature "signed in user can log out" do

  let!(:user) { FactoryBot.create(:user) }

  before do
    login_as(user)
  end

  scenario "log out" do
    visit "/"
    click_button "Sign out"

    expect(page).to have_content "Signed out Successfully"
  end
end
