class StatusJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Onlinestatus.find_each do |serial|
      if ( serial.online? && ((Time.now.utc - serial.updated_at) > 40 ))
        serial.online = false
        serial.save
        puts "test"
        OnlinestatusChannel.broadcast_to(
          serial,
          ApplicationController.new.render_to_string(partial: "appliances/online_status_button", locals: { online_status: serial })
        )
        # render_to_string n'existe pas ici
      end
    end
  end
end
