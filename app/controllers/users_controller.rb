class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_home_path, notice: "Welcome, #{@user.first_name}!"
    else
      render :new, status: :unprocessable_entity, alert: "Error creating user: #{@user.errors.full_messages.join(", ")}"
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
