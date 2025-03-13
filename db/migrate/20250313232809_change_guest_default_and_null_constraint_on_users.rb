class ChangeGuestDefaultAndNullConstraintOnUsers < ActiveRecord::Migration[8.0]
  def change
    change_column_default :users, :guest, true
    change_column_null :users, :guest, false
  end
end
