class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :type
      t.string :value
      t.datetime :occurs_at
      t.string :appliance_serial_number

      t.timestamps
    end
  end
end
