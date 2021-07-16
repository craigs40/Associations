class AttendeeController < ApplicationController
  def join
    @attendee = Attendee.new(event_id: params[:id], user_id: current_user.id)
    @attendee.save
    redirect_to events_path
  end
end
