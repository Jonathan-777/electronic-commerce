class ChangeFirstAndLastNameDefaultsOnUsers < ActiveRecord::Migration[8.0]
  def change
    change_column_default :users, :first_name, ""
    change_column_default :users, :last_name, ""
    
    change_column_null :users, :first_name, false, ""
    change_column_null :users, :last_name, false, ""
  end
end
