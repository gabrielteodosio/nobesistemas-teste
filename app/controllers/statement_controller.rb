class StatementController < SecuredController
  def index
    @statements = current_user.statements
  end

  def info
    @statement ||= Statement.find_by_id(params[:id])
  end

  def new
    @statement ||= Statement.new(user: current_user)
  end

  def create
    statement_params = params[:statement]

    @statement ||= Statement.new(
      user: current_user,
      end_date: statement_params[:end_date],
      start_date: statement_params[:start_date]
    )

    if @statement.save
      redirect_to action: :info, id: @statement.id
    else
      puts 'failed'
    end
  end
end
