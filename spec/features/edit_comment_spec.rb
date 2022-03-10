require "rails_helper"

RSpec.feature "user can edit an existing comment" do
  it ", with valid attributes" do
    # visit posts#show
    post = FactoryBot.create(:post, title: "Post one", description: "Post one desc")
    comment = FactoryBot.create(:comment, post: post, content: "Post one desc")

    visit post_path(post)

    expect(page).to have_content "Post one"
    # since commentsoccur in the show page
    click_link "Edit Comment"

    fill_in "Content", with: "Post comment updated"

    click_button "Update Comment"
    # assertion
    # expect(page).to have_content "Comment successfully updated"
    # expect(page.current_url).to eq post__comment_path(comment)
  end
end
