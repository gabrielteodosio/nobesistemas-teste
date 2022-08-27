class DepositController < SecuredController
  def index
    @deposits = current_user.deposits
  end

  def info
    @deposit ||= Deposit.find_by_id(params[:id])
  end

  def new
    @deposit ||= Deposit.new
  end

  def create
    deposit_params = params[:deposit]

    @deposit ||= Deposit.new(
      user: current_user,
      amount: deposit_params[:amount].to_f
    )

    if @deposit.save
      redirect_to dashboard_url
    else
      puts 'failed'
    end
  end
end
