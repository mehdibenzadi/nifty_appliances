class CreateOnlinestatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :onlinestatuses do |t|
      t.string :serial_number
      t.boolean :online

      t.timestamps
    end
  end
end
