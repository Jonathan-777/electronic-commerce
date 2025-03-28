class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :credit_card_number
      t.string :expiration_date
      t.string :cvv
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
