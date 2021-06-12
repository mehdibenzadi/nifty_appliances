class DestroyExpiredSerialNumbersJob < ApplicationJob
  queue_as :default

  def perform
    serial_numbers = SerialNumber.where('created_at < ?', 1.minutes.ago).destroy_all
  end
end
