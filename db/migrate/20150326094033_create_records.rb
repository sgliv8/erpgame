class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.integer :round
      t.decimal :begin_cash, precision: 12, scale: 2
      t.decimal :expenses, precision: 12, scale: 2
      t.decimal :revenue, precision: 12, scale: 2
      t.decimal :inventory_penalty, precision: 12, scale: 2
      t.decimal :order_penalty, precision: 12, scale: 2
      t.decimal :end_cash, precision: 12, scale: 2
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :records, :users
  end
end
