class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :post_code, null: false
      t.string  :city, null: false
      t.string  :house_number, null: false
      t.string  :building_name
      t.integer :phone_number, null: false
      t.integer :prefecture_id, null: false
      t.bigint  :user_id
      t.bigint  :item_id
      t.timestamps
    end
    add_foreign_key :orders, :users
    add_foreign_key :orders, :items
  end
end
