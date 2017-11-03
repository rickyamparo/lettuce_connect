class HandlesController < ApplicationController

  def index
    @handles = User.find(params[:user_id]).handles
  end

  def new
    @user = User.find(params[:user_id])
    @handle = Handle.new
  end

  def create
    @handle = Handle.new(handle_params)
    if @handle.save
      flash[:success] = "A new handle has been added"
      redirect_to root_path
    else
      flash[:failure] = "There was an error"
      redirect_to new_user_handle_path(current_user)
    end
  end

  private

    def handle_params
      params.require(:handle).permit(:name, :handle_type_id, :user_id)
    end

end
