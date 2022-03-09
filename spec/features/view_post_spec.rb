require "rails_helper"

RSpec.feature "user can view post" do
  it ", with valid attributes" do
    # create post bot
    FactoryBot.create(:post, title: "Post one", description: "Post one desc")
    # from root
    visit "/"
    # visit show
    click_link "Show"
    # assertion
    expect(page).to have_content "Post one"
  end
end
