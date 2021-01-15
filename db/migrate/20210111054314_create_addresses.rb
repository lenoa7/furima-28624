class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string  :post_code, null: false
      t.string  :city, null: false
      t.string  :house_number, null: false
      t.string  :building_name
      t.string  :phone_number, null: false
      t.integer :prefecture_id, null: false
      t.bigint  :user_id
      t.bigint  :item_id
      t.bigint  :order_id
      t.timestamps
    end
    add_foreign_key :addresses, :orders
    add_foreign_key :addresses, :users
    add_foreign_key :addresses, :items
  end
end
