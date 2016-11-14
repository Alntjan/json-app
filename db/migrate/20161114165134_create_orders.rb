class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :shop_id, null: false
      t.bigint :shopify_order_id, null: false
      t.jsonb :order_data

      t.timestamps
    end
    add_index :orders, :shop_id
    add_index :orders, :shopify_order_id, unique: true
    add_index :orders, :order_data, using: :gin

    add_foreign_key :orders, :shops, on_delete: :cascade
  end
end
