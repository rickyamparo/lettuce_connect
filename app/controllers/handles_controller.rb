class HandlesController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @handle = Handle.new
  end

end
