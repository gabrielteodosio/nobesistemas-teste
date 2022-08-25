class Withdraw < ApplicationRecord
  belongs_to :user

  has_many :statement_withdraws, class_name: 'StatementWithdraw'
  has_many :statements, through: :statement_withdraws

  before_create do
    balance = user.balance
    return false if balance.amount < amount
  end

  after_create do
    balance = user.balance
    balance.amount -= amount
  end
end
