class WithdrawController < SecuredController
  def index
    @withdraws = current_user.withdraws
  end

  def new
    @withdraw ||= Withdraw.new(user: current_user)
  end

  def create
    withdraw_params = params[:withdraw]

    @withdraw ||= Withdraw.new(
      user: current_user,
      amount: withdraw_params[:amount].to_f
    )

    if @withdraw.save
      redirect_to dashboard_url
    else
      puts 'failed'
    end
  end
end
