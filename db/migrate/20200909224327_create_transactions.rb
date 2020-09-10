class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.float :price
      t.integer :member_id
      t.integer :currency_id
      t.integer :serial
      t.integer :quantity

      t.timestamps
    end
  end
end
