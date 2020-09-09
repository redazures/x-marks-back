class CreateCurrencies < ActiveRecord::Migration[6.0]
  def change
    create_table :currencies do |t|
      t.float :price
      t.string :symbol
      t.string :name
      t.string :image

      t.timestamps
    end
  end
end
