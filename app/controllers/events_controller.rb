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
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to action: 'index', notice: 'Event Saved!'
    else
      redirect_to action: 'new', notice: 'Event could not be saved.'
    end
  end

  def show
    @event = Event.find(params[:id])
    @attendees = @event.attendees
  end

  def upcoming
    @upcoming_events = Event.upcoming_events
  end

  def past
    @past_events = Event.past_events
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :location, :date)
  end
end
