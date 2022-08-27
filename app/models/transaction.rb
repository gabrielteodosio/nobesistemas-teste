class Transaction < ApplicationRecord
  has_many :statement_transactions, class_name: 'StatementTransaction'
  has_many :statements, through: :statement_transactions

  before_save do
    balance = User.find(sender_id).balance
    receiver = User.find_by_id(receiver_id)
    return false if balance.amount.negative? || receiver.nil?
  end

  after_save do
    sender_balance = User.find(sender_id).balance
    receiver_balance = User.find(receiver_id).balance

    sender_balance.amount -= amount
    receiver_balance.amount += amount

    sender_balance.save
    receiver_balance.save
  end
end
