class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    if signed_in?
      @created_events = current_user.created_events
      @attended_events = current_user.event_attended
    else
      redirect_to login_path
    end
  end
end
