class Api::V1::ConnectionsController < ApplicationController

  def index
    render json: Connection.all
  end

  def show
    render json: Connection.find(params[:id])
  end

  def user_connections
    render json: Connection.where(user: params[:id])
  end
end
