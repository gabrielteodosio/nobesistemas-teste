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
    transaction_params = params[:transaction]

    @transaction ||= Transaction.new(
      sender_id: current_user.id,
      receiver_id: transaction_params[:receiver_id],
      amount: transaction_params[:amount].to_f
    )

    if @transaction.save
      redirect_to dashboard_url
    else
      puts 'failed'
    end
  end
end
