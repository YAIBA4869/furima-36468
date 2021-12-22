class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.references :purchase_record, null: false, foreign_key: true
      t.string  :postal_code, null: false
      t.string  :city, null: false
      t.integer :prefecture_id, ull: false
      t.string  :addresses, null: false
      t.string  :building
      t.string  :phone_number, null: false
      t.timestamps
    end
  end
end
