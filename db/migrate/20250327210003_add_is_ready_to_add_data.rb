class AddIsReadyToAddData < ActiveRecord::Migration[8.0]
  def change
    add_column :user_data, :ready_for_data_entry, :boolean
  end
end
