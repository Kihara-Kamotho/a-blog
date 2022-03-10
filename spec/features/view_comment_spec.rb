require "rails_helper"

RSpec.feature "user can view comment to a post" do
  it ", with invalid attributes" do
    # visit posts#show
    # render all comments to a post in the posts#show page
    post = FactoryBot.create(:post, title: "Post one", description: "Post one desc")
    FactoryBot.create(:comment, post: post, content: "Hello world")

    visit post_path(post)

    expect(page).to have_content "Post one"
    # show post comment
    click_link "Show"
    # assertion
    expect(page).to have_content "Hello world"
  end
end
