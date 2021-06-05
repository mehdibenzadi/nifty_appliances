class CreateSerialNumbers < ActiveRecord::Migration[6.1]
  def change
    create_table :serial_numbers do |t|
      t.string :value

      t.timestamps
    end
  end
end
