require "rails_helper"

RSpec.feature "user can delete comment" do
  it ", with valid attributes" do
    post = FactoryBot.create(:post, title: "Post one", description: "Post one desc")
    FactoryBot.create(:comment, post: post, content: "Hello world")

    # visit posts#show
    visit post_path(post)
    # click btn delete
    click_button "Delete Comment"
    # assertion
    expect(page).to have_content "Comment has been deleted"
  end
end
