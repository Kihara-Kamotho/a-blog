require "rails_helper"

RSpec.feature "admin user can edit existing post" do
  # to delete a post you must be an admin
  before do
    login_as(FactoryBot.create(:user, :admin))
    FactoryBot.create(:post, title: "Post one", description: "Post one desc")
    # navigate to post show
    visit "/"
    # while in post#show, click edit
  end
  it "with valid attributes" do

    # visit posts#show
    click_link "Post one"
    # click_link edit post
    click_link "Edit Post"

    fill_in "Title", with: "Project one upd"
    fill_in "Description", with: "Project one desc, upd"

    click_button "Update Post"

  end
end
