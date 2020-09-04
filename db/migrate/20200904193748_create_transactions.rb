class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.integer :price
      t.integer :member_id
      t.integer :currency_id
      t.integer :serial
      t.boolean :leg1

      t.timestamps
    end
  end
end
