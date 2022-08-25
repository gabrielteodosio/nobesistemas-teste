class TransactionController < SecuredController
  def index
    @transactions = current_user.transactions
  end

  def info
    transaction_id = params[:id]
    @transaction ||= Transaction.find_by_id(transaction_id)
  end

  def new
    @transaction ||= Transaction.new
    @transaction.sender_id = current_user.id
  end

  def create
    @transaction.save unless @transaction.nil?
  end
end
