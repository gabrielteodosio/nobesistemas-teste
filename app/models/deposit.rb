class Deposit < ApplicationRecord
  belongs_to :user

  has_many :statement_deposits, class_name: 'StatementDeposit'
  has_many :statements, through: :statement_deposits
end
