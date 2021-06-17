class EventsController < ApplicationController
  skip_before_action :verify_authenticity_token, :authenticate_user!, only:[:create]
  before_action :verify_serial, only:[:create]
  # before_action :declare_view_type

  def create
    @event = Event.new(event_params)
    if @event.save
      process_data(@event)
      head :ok
    else
      head :unprocessable_entity
    end
  end

  private
    def event_params
      params.permit(:event_type, :value, :occurs_at, :serial_number)
    end

    def verify_serial
      head :unauthorized unless Appliance.find_by(serial_number: event_params[:serial_number])
    end

    # def declare_view_type
    #   @view_type = 1
    # end
end
