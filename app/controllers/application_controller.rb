class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # config.active_job.queue_adapter = :sidekiq

  def isonline (event) 
    appliance_monitored = Onlinestatus.find_by(serial_number: event.serial_number)
    if appliance_monitored
      appliance_monitored.online = true
      appliance_monitored.save
      appliance_monitored.touch
    else
      register = Onlinestatus.new(serial_number: event.serial_number, online: true)
      register.save
    end
  end

  def isdiscoverable (serial_number)
    SerialNumber.exists?(value: serial_number)
  end

  def process_data(event)
    case event.event_type
    when "status"
      isonline (event)
    when "discoverable"
      @discoverable = SerialNumber.new()
      @discoverable.value = event.serial_number
      @discoverable.save
    when "error"
      
    else
      
    end
  end

end
