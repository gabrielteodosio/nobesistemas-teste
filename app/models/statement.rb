class StatementDeposit < ApplicationRecord
  belongs_to :statement, class_name: 'Statement'
  belongs_to :deposit, class_name: 'Deposit'
end

class StatementWithdraw < ApplicationRecord
  belongs_to :statement, class_name: 'Statement'
  belongs_to :withdraw, class_name: 'Withdraw'
end

class StatementTransaction < ApplicationRecord
  belongs_to :statement, class_name: 'Statement', foreign_key: 'statement_id'
  belongs_to :transacs, class_name: 'Transaction', foreign_key: 'transaction_id'
end

class Statement < ApplicationRecord
  belongs_to :user

  has_many :statement_deposits, class_name: 'StatementDeposit'
  has_many :deposits, through: :statement_deposits

  has_many :statement_withdraws, class_name: 'StatementWithdraw'
  has_many :withdraws, through: :statement_withdraws

  has_many :statement_transactions, class_name: 'StatementTransaction'
  has_many :transactions, through: :statement_transactions, source: :transacs
end
