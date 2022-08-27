class Withdraw < ApplicationRecord
  belongs_to :user

  has_many :statement_withdraws, class_name: 'StatementWithdraw'
  has_many :statements, through: :statement_withdraws

  after_save do
    owner_balance = user.balance
    owner_balance.amount -= amount
    owner_balance.save
  end
end
