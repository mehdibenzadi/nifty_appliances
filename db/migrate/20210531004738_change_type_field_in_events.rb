class ChangeTypeFieldInEvents < ActiveRecord::Migration[6.1]
  def change
    rename_column :events, :type, :event_type
    rename_column :events, :appliance_serial_number, :serial_number
  end
end
