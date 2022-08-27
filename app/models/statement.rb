class Statement < ApplicationRecord
  belongs_to :user

  has_many :statement_deposits, class_name: 'StatementDeposit'
  has_many :deposits, through: :statement_deposits

  has_many :statement_withdraws, class_name: 'StatementWithdraw'
  has_many :withdraws, through: :statement_withdraws

  has_many :statement_transactions, class_name: 'StatementTransaction'
  has_many :transactions, through: :statement_transactions, source: :transacs

  before_save do
    self.deposits = Deposit.where(user: user)
      .where('DATE(created_at) >= ? AND DATE(created_at) <= ?', start_date, end_date)
      .order(created_at: :desc)

    self.withdraws = Withdraw.where(user: user)
      .where('DATE(created_at) >= ? AND DATE(created_at) <= ?', start_date, end_date)
      .order(created_at: :desc)

    self.transactions = Transaction.where('sender_id = ? OR receiver_id = ?', user.id, user.id)
      .where('DATE(created_at) >= ? AND DATE(created_at) <= ?', start_date, end_date)
      .order(created_at: :desc)
  end
end
