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
      redirect_to new_connection_path
    end
  end

  private

    # def scanned_id_validation(scanned_id)
    #   if User.find(scanned_id).nil?
    #     scanned_id = nil
    #     connection_params[:scanned_id] = nil
    #   end
    # end

    def connection_params
      if User.exists?(params[:connection][:scanned_id]) == false
        params[:connection][:scanned_id] = nil
      end
      params.require(:connection).permit(:scanned_id, :user_id)
    end

end
