class AddRoleToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :repairer, :boolean, default: false
  end
end
