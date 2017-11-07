class Api::V1::ConnectionsController < ApplicationController

  def index
    render json: Connection.all
  end

end
