class CreateUserData < ActiveRecord::Migration[8.0]
  def change
    create_table :user_data do |t|
      t.references :user, null: false, foreign_key: true
      t.string :bio
      t.integer :age
      t.string :phone_number
      t.date :date_of_birth
      t.string :address
      t.string :recovery_email

      t.timestamps
    end
  end
end
