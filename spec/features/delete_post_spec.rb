require "rails_helper"

RSpec.feature "user can delete existing post" do
  it ", with valid attributes" do
    # post bot
    post = FactoryBot.create(:post, title: "Project one", description: "Project one desc")
    # visit posts#show
    visit post_path(post)
    # click link delete post
    click_button "Delete Post"

    # expect(page.current_url).to eq posts_path
    expect(page).to have_content "Post has been deleted"
  end
end
