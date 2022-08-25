class DashboardController < SecuredController
  before_action :authenticate_user!

  def index
  end
end
