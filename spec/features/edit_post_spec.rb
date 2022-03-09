require "rails_helper"

RSpec.feature "user can edit existing post" do
  it ", with valid attributes" do
    post = FactoryBot.create(:post, title: "Post one", description: "Post one desc")
    # visit posts#show
    visit post_path(post)
    # click_link edit post
    click_link "Edit Post"

    fill_in "Title", with: "Project one upd"
    fill_in "Description", with: "Project one desc, upd"

    click_button "Update Post"
  end
end
