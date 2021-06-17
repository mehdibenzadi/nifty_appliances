class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # config.active_job.queue_adapter = :sidekiq

  def is_online(event)
    p "is online"
    appliance_monitored = Onlinestatus.find_or_initialize_by(serial_number: event.serial_number)
    appliance_monitored.online = true
    appliance_monitored.save
    appliance_monitored.touch
    OnlinestatusChannel.broadcast_to(
      appliance_monitored,
      render_to_string(partial: "appliances/online_status_button", locals: { online_status: appliance_monitored })
    )
  end

  def process_data(event)
    case event.event_type
    when "status"
      is_online(event)
    when "cycle"
      print "cycle"
    when "error"
      print "error"
    else
      print "else"
    end
  end

end
