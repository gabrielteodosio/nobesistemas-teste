class DashboardController < SecuredController
  def index
    @balance = current_user.balance
    @balance_amount = ActionController::Base.helpers.number_to_currency(@balance.amount, unit: "R$ ", separator: ",", delimiter: ".")
  end
end
