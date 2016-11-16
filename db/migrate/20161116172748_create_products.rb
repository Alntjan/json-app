class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :handle
      t.string :image
      t.string :title
      t.string :vendor

      t.timestamps
    end
  end
end
