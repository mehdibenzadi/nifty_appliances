class AddTypeToAppliances < ActiveRecord::Migration[6.1]
  def change
    add_column :appliances, :family, :integer
  end
end
