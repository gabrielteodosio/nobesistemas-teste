class WithdrawController < SecuredController
  def index
    @withdraws = current_user.withdraws
  end

  def info
    withdraw_id = params[:id]
    @withdraw ||= Withdraw.find_by_id(withdraw_id)
  end

  def new
    @withdraw ||= Withdraw.new
    @withdraw.user = current_user
  end

  def create
    @withdraw.save unless @withdraw.nil?
  end
end
