class ChangeFirstAndLastNameDefaultsInUsers < ActiveRecord::Migration[8.0]
  def change
    change_column :users, :first_name, :string, default: nil, null: true
    change_column :users, :last_name, :string, default: nil, null: true
  end
end
