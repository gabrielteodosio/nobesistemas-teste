class Deposit < ApplicationRecord
  belongs_to :user

  has_many :statement_deposits, class_name: 'StatementDeposit'
  has_many :statements, through: :statement_deposits

  before_save do
    return false if amount.negative?
  end

  after_save do
    owner_balance = user.balance
    owner_balance.amount += amount
    owner_balance.save
  end
end
