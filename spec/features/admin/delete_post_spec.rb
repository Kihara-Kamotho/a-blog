require "rails_helper"

RSpec.feature "Admin user can delete existing post" do
  # only admin can delete post
  before do
    login_as(FactoryBot.create(:user, :admin))
    # post bot
    FactoryBot.create(:post, title: "Post one", description: "Project one desc")
    # root path
    visit "/"
  end

  it ", with valid attributes" do
    # visit posts#show
    # visit post_path(post)
    click_link "Post one"
    # click link delete post
    click_button "Delete Post"

    # expect(page.current_url).to eq posts_path
    expect(page).to have_content "Post has been deleted"
  end
end
