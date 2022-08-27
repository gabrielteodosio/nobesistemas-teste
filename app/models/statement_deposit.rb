class StatementDeposit < ApplicationRecord
  belongs_to :statement, class_name: 'Statement'
  belongs_to :deposit, class_name: 'Deposit'
end
