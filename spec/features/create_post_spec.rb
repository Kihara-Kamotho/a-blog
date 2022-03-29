require "rails_helper"

RSpec.feature "user can create a post" do
  before do
    #admin
    login_as(FactoryBot.create(:user, :admin))
  end
  
  it ", with valid attributes" do
    # visit root path, posts#index
    visit "/"
    # click link New post
    click_link "New Post"
    # fill_in new post
    fill_in "Title", with: "Post one"
    fill_in "Description", with: "Post one desc"

    click_button "Create Post"
  end
end
