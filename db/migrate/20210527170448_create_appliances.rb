class CreateAppliances < ActiveRecord::Migration[6.1]
  def change
    create_table :appliances do |t|
      t.string :model
      t.string :serial_number
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
