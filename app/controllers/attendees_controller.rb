class AttendeesController < ApplicationController
  before_action :authenticate_user!

  def index
    @attendeess = Attendee.all
  end

  def new
    @attendee = Attendee.new
  end

  def create
    @attendee = current_user.created_events.build(event_params)
    if @attendee.save
      redirect_to '/users/show', notice: 'Attendance Saved!'
    else
      redirect_to action: 'new', notice: 'Attendance could not be saved.'
    end
  end

  def show
    @attendee = Attendee.find(params[:id])
    @attendees = @event.attendees
  end

  private

  def event_params
    params.require(:attendee).permit(:attendee_id)
  end
end
