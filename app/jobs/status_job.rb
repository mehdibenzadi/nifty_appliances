class StatusJob < ApplicationJob
  queue_as :default 

  def perform(*args)
    Onlinestatus.find_each do |serial|
      if ( serial.online? && ((Time.now.utc - serial.updated_at) > 40 ))
        serial.online = false
        serial.save
      end
    end
  end
end
