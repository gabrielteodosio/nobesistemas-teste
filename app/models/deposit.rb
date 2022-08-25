class Deposit < ApplicationRecord
  belongs_to :user

  has_many :statement_deposits, class_name: 'StatementDeposit'
  has_many :statements, through: :statement_deposits

  before_create do
    return false if amount.negative?
  end

  after_create do
    balance = user.balance
    balance.amount += amount
  end
end
