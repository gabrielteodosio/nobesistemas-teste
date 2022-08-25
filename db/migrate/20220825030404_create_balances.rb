class CreateBalances < ActiveRecord::Migration[7.0]
  def change
    create_table :balances do |t|
      t.float :amount, default: 0

      t.belongs_to :user

      t.timestamps
    end
  end
end
