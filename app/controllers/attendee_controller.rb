class AttendeeController < ApplicationController
  def join
    @attendee = Attendee.new(event_id: params[:id], user_id: current_user.id)
    if @attendee.save
      redirect_to events_path, notice: 'Attendance Saved!'
    else
      redirect_to action: 'index', alert: 'Attendance could not be saved.'
    end
  end
end
