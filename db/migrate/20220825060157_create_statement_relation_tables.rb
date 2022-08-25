class CreateStatementRelationTables < ActiveRecord::Migration[7.0]
  def change
    create_table :statement_deposits, id: false do |t|
      t.belongs_to :statement
      t.belongs_to :deposit
    end

    create_table :statement_withdraws, id: false do |t|
      t.belongs_to :statement
      t.belongs_to :withdraw
    end

    create_table :statement_transactions, id: false do |t|
      t.belongs_to :statement
      t.belongs_to :transaction
    end
  end
end
