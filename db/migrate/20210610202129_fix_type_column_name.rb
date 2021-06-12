class FixTypeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :appliances, :type, :family
  end
end
