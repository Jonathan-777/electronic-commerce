class RemoveAgeFromUserData < ActiveRecord::Migration[8.0]
  def change
    remove_column :user_data, :age, :integer
  end
end
