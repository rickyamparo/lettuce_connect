class ConnectionsController < ApplicationController

  def index
    @user = current_user
    @connections = @user.connections
  end

  def new
    @connection = Connection.new
  end

end
