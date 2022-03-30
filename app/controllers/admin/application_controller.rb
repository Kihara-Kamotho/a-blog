class Admin::ApplicationController < ApplicationController
  before_action :authorize_admin!

  def index
  end

  private
  def authorize_admin!
    # check if user is logged in
    authenticate_user!

    # check whether the current_user is an admin
    # if current_user.admin?
    #   redirect_to "/admin"
    # else
    #   redirect_to root_path
    #   flash[:notice] = "You are not an admin"
    # end
    # unless block
    unless current_user.admin?
      redirect_to root_path, flash: { alert: "You are not an admin"}
    end
  end
end
