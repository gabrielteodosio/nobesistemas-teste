class Transaction < ApplicationRecord
  has_many :statement_transactions, class_name: 'StatementTransaction'
  has_many :statements, through: :statement_transactions
end
