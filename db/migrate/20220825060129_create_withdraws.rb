class CreateWithdraws < ActiveRecord::Migration[7.0]
  def change
    create_table :withdraws do |t|
      t.float :amount, null: false, default: 0

      t.belongs_to :user

      t.timestamps
    end
  end
end
