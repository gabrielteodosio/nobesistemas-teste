class Withdraw < ApplicationRecord
  belongs_to :user

  has_many :statement_withdraws, class_name: 'StatementWithdraw'
  has_many :statements, through: :statement_withdraws
end
