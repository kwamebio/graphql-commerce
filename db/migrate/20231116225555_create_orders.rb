class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :order_number
      t.decimal :order_amount
      t.string :order_type
      t.string :payment_type
      t.datetime :canceled_at
      t.datetime :completed_at
      t.datetime :returned_at
      t.string :status
      t.belongs_to :product, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      

      t.timestamps
    end
  end
end
