class StatementWithdraw < ApplicationRecord
  belongs_to :statement, class_name: 'Statement'
  belongs_to :withdraw, class_name: 'Withdraw'
end
