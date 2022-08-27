class TransactionController < SecuredController
  def index
    @transactions = current_user.transactions
  end

  def new
    @transaction ||= Transaction.new
    @transaction.sender_id = current_user.id
  end

  def create
    transaction_params = params[:transaction]

    sender_name = "#{current_user.first_name} #{current_user.last_name}"
    formatted_amount = helpers.number_to_currency(transaction_params[:amount].to_f, unit: 'R$ ', separator: ',', delimiter: '.')

    receiver = User.where(email: transaction_params[:receiver_email]).first
    receiver_name = "#{receiver.first_name} #{receiver.last_name}"

    puts "=-=-=-=-=-==-=--"
    puts "#{sender_name} transfered #{formatted_amount} to #{receiver_name}"

    @transaction ||= Transaction.new(
      receiver_id: receiver.id,
      sender_id: current_user.id,
      amount: transaction_params[:amount].to_f,
      description: "#{sender_name} transfered #{formatted_amount} to #{receiver_name}"
    )

    if @transaction.save
      redirect_to dashboard_url
    else
      puts 'failed'
    end
  end
end
