class EventsController < ApplicationController

  before_action :logged_in_user, only: [:new, :create]

  def index
  	@events = Event.all
  end

  def show
  	@event = Event.find(params[:id])
  end

  def new
  	@event = current_user.events.build
  end

  def create
  	@event = current_user.events.build(event_params)
  	if @event.save
  	  flash[:success] = "Event was created"
  	  redirect_to event_path(@event)
  	else
  	  render 'new'
  	end
  end

  private

    def event_params
      params.require(:event).permit(:title, :date, :description, :location)
    end
end
