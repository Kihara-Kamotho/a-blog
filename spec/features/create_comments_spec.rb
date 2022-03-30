require "rails_helper"

RSpec.feature "user can create comment to a post" do
  it ", with valid attributes" do
    # visit posts#show
    post = FactoryBot.create(:post, title: "Post one", description: "Post one desc")
    visit post_path(post)

    # create comment
    click_link "New Comment"

    fill_in "content", with: "Comment one"

    click_button "Create Comment"
  end
end
