class ConnectionsController < ApplicationController

  def index
    @user = current_user
    @connections = @user.connections
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
      render :new
    end
  end

  private

  def connection_params
    params.require(:connection).permit(:scanned_id, :user_id)
  end

end
