class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  # config.active_job.queue_adapter = :sidekiq
  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:repairer])
  end

  def is_online(event)
    p "is online"
    appliance_monitored = Onlinestatus.find_or_initialize_by(serial_number: event.serial_number)
    appliance_monitored.online = !appliance_monitored.online
    appliance_monitored.save
    appliance_monitored.touch
    OnlinestatusChannel.broadcast_to(
      appliance_monitored,
      render_to_string(partial: "appliances/online_status_button", locals: { online_status: appliance_monitored })
    )
  end

  def isdiscoverable (serial_number)
    SerialNumber.exists?(value: serial_number)
  end

  def make_discoverable (serial_number)
    @discoverable = SerialNumber.new()
    @discoverable.value = serial_number
    @discoverable.save
  end

  def process_data(event)
    case event.event_type
    when "status"
      is_online(event)
    when "discoverable"
      make_discoverable(event.serial_number)
    when "error"
      print "error"
    else
      print "else"
    end
  end

end
