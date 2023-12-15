class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.belongs_to :product
      t.belongs_to :order
      t.integer :quantity, default: 1
      t.decimal :unit_price, precision: 7, scale: 2

      t.timestamps
    end
  end
end
