class StatementTransaction < ApplicationRecord
  belongs_to :statement, class_name: 'Statement', foreign_key: 'statement_id'
  belongs_to :transacs, class_name: 'Transaction', foreign_key: 'transaction_id'
end
