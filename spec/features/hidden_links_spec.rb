require "rails_helper"

RSpec.feature "hidden links" do
  # user and admin variables/bots
  let(:user) {FactoryBot.create(:user)}
  let(:admin) {FactoryBot.create(:user, :admin)}
  # post bot
  let(:post) {FactoryBot.create(:post)}

  # anonynous person
  context "anonynous user" do
    # new post link
    scenario "cannot see the new post link" do
      visit "/"
      expect(page).not_to have_link "New Post"
    end
    # edit post link
    scenario "cannot see the edit post link" do
      visit post_path(post)
      expect(page).not_to have_link "Edit Post"
    end
    # delete post link
    scenario "cannot see the delete post link" do
      visit post_path(post)
      expect(page).not_to have_link "Delete Post"
    end
  end

  # regular user
  context "regular user" do
    before { login_as(user) }
    # new post link
    scenario "cannot see the New Post link" do
      visit "/"
      expect(page).not_to have_link "New Post"
    end
    # edit post link
    scenario "cannot see the edit post link" do
      visit post_path(post)
      expect(page).not_to have_link "Edit Post"
    end
    # delete post link
    scenario "cannot see the delete post link" do
      visit post_path(post)
      expect(page).not_to have_link "Delete Post"
    end
  end

  # admin user
  context "admin user" do
    before { login_as(admin) }
    # new post link
    scenario "can view the New Post link" do
      visit "/"
      expect(page).to have_link "New Post"
    end
    # edit post link
    scenario "can see the edit post link" do
      visit post_path(post)
      expect(page).to have_link "Edit Post"
    end
    # delete post link
    scenario "admin user can delete post" do
      visit post_path(post)
      expect(page).to have_link "Delete Post"
    end
  end
end
