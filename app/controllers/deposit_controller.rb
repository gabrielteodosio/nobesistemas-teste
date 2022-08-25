class DepositController < SecuredController
  def index
    @deposits = current_user.deposits
    render template: 'deposit/index'
  end

  def info
    deposit_id = params[:id]
    @deposit ||= Deposit.find_by_id(deposit_id)
    render template: 'deposit/info'
  end

  def new
    @deposit ||= Deposit.new
    render template: 'deposit/new'
  end

  def create
    if !@deposit.nil? && @deposit.save
      render template: 'deposit/index'
    end
    return false
  end
end
