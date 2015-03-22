class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :user, index: true
      t.string :description
      t.integer :type, null: false
      t.boolean :compensated, default: false
      t.datetime :compensated_at
      t.money :value, null: false, default: 0

      t.timestamps
    end
    add_index :transactions, :type
  end
end
