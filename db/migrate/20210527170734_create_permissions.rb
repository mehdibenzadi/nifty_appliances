class CreatePermissions < ActiveRecord::Migration[6.1]
  def change
    create_table :permissions do |t|
      t.references :appliance, null: false, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
