require "rails_helper"

RSpec.feature "user can view post" do
  it ", with valid attributes" do
    # create post bot
    post = FactoryBot.create(:post, title: "Post one", description: "Post one desc")
    # from root
    visit "/"
    # visit show
    click_link post.title
    # assertion
    expect(page).to have_content "Post one"
  end
end
