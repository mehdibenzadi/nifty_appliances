class DestroyExpiredSerialNumbersJob < ApplicationJob
  queue_as :default
  def perform
    # TODO (1)
    serial_numbers = SerialNumbers.where(created_at: 5)
  end
end
