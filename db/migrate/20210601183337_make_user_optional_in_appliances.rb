class MakeUserOptionalInAppliances < ActiveRecord::Migration[6.1]
  def change
    change_column_null :appliances, :user_id, true
  end
end
