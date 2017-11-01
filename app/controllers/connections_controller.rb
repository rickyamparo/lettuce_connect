class ConnectionsController < ApplicationController

  def index
    @user = current_user
    @conenctions = @user.connections
  end

end
