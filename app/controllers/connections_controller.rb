class ConnectionsController < ApplicationController

  def index
    @user = current_user
    @connections = @user.connections
  end

  def show
    @connection = Connection.find(params[:id])
    raw_github_events = GithubService.recent_events(@connection)
    @github_events = GithubEvent.recent_events(raw_github_events.first(3))
  end

  def new
    @connection = Connection.new
  end

  def create
    @connection = Connection.new(connection_params)
    if @connection.save
      flash[:success] = "You've added a new connection!"
      redirect_to connections_path
    else
      flash[:message] = "That was not a valid lettuce id"
      redirect_to new_connection_path
    end
  end

  def destroy
    connection = Connection.find(params[:id])
    flash[:message] = "You have deleted your connection with #{connection.scanned_user.first_name}"
    connection.destroy
    redirect_to connections_path
  end

  private

    def scanned_id_params
      params[:connection][:scanned_id]
    end

    def connection_params
      if User.exists?(scanned_id_params) == false
        params[:connection][:scanned_id] = nil
      end
      params.require(:connection).permit(:scanned_id, :user_id)
    end

end
