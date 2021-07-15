class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @events = Event.all
    @upcoming_events = Event.upcoming_events
    @past_events = Event.past_events
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to events_path, notice: 'Event Saved!'
    else
      redirect_to action: 'new', alert: 'Event could not be saved.'
    end
  end

  def show
    @event = Event.find(params[:id])
    @attendees = @event.attendees
  end

  private

  def event_params
    params.require(:event).permit(:name, :description)
  end
end
