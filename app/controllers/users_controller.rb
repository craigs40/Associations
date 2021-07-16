class UsersController < ApplicationController
  def profile
    if signed_in?
      @created_events = current_user.created_events
      @attended_events = current_user.attended_events
    else
      redirect_to login_path
    end
  end
end
