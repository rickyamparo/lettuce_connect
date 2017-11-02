class ConnectionsController < ApplicationController

  def index
    @user = current_user
    @connections = @user.connections
  end

end
