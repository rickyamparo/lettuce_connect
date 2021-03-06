class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Logged in"
      redirect_to root_path
    else
      flash[:message] = "You have made a mistake"
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if current_user != nil
      current_user.update(user_params)
      redirect_to root_path
    else
      render file: "/public/404"
    end
  end


  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end

end
