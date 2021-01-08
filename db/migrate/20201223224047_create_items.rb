class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.timestamps
      t.string :name , null: false
      t.string :introduce, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :delivery_fee_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :delivery_days_id , null: false
      t.integer :price, null: false
      t.bigint :user_id
    end
    add_foreign_key :items, :users
  end
end
