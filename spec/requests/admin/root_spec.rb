require "rails_helper"

RSpec.describe "/admin", type: :request do
  describe "/GET" do
    let(:user) { FactoryBot.create(:user)}
    let(:admin) { FactoryBot.create(:user, :admin)}
    # singed in as user
    context "singed in as user" do
      #login as user
      before do
        login_as(user)
      end

      # trying to access admin console as a normal user, should fail
      it "redirects away" do
        get '/admin'
        expect(response).to have_http_status(302)
      end
    end

    # signed in as Admin
    context "signed in as admin" do
      # login as Admin
      before do
        login_as(admin)
      end

      # trying to access admin panel as admin, access granted
      it "lets admin in" do
        get "/admin"
        expect(response).to have_http_status(200)
      end
    end
  end
end
