class Withdraw < ApplicationRecord
  belongs_to :user

  has_many :statement_withdraws, class_name: 'StatementWithdraw'
  has_many :statements, through: :statement_withdraws

  before_save do
    owner_balance = user.balance
    return false if owner_balance.amount < amount
  end

  after_save do
    owner_balance = user.balance
    owner_balance.amount -= amount
    owner_balance.save
  end
end
