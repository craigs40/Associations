class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to posts_path, notice: 'Event Saved!'
    else
      redirect_to action: 'new', alert: 'Event could not be saved.'
    end
  end
end
