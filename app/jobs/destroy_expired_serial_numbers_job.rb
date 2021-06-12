class DestroyExpiredSerialNumbersJob < ApplicationJob
  def perform
    # TODO (1)
    serial_numbers = SerialNumber.where(created_at: 5.minutes.ago..Time.now).destroy_all
  end
end
