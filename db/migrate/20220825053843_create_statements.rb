class CreateStatements < ActiveRecord::Migration[7.0]
  def change
    create_table :statements do |t|
      t.date :start_date, null: false
      t.date :end_date, null: false

      t.belongs_to :user

      t.timestamps
    end
  end
end
