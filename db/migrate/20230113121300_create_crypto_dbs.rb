class CreateCryptoDbs < ActiveRecord::Migration[7.0]
  def change
    create_table :crypto_dbs do |t|
      t.string :symbol
      t.string :user_integer
      t.decimal :cost_per
      t.decimal :amount_owned

      t.timestamps
    end
    add_index :crypto_dbs, :user_integer
  end
end
