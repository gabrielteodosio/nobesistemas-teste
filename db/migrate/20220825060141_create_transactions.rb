class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.float :amount, null: false, default: 0

      t.bigint :sender_id
      t.bigint :receiver_id

      t.timestamps
    end
  end
end
