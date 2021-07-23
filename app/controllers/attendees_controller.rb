class AttendeesController < ApplicationController
  before_action :authenticate_user!

  def index
    @attendeess = Attendee.all
  end

  def create
    @event = Event.find(params[:event_id])
    @attendee = Attendee.new(event_id: @event.id, user_id: params[:user_id])
    @attendee.save
    redirect_to '/users/show', notice: 'Attendance Saved!'
  end

  def show
    @attended_events = current_user.attended_events
  end
end
