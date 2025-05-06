class PasswordsController < ApplicationController
  before_action :require_user_logged_in!

  def edit
  end

  def update
    @user = Current.user
    puts "Updating password for user: #{@user.id}"
    if @user.update(password: password_params[:new_password], password_confirmation: password_params[:new_password_confirmation])
      redirect_to root_path, notice: "Password updated successfully."
    else
      flash[:alert] = "Error updating password: #{@user.errors.full_messages.join(", ")}"
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def password_params
    params.require(:user).permit(:new_password, :new_password_confirmation)
  end
end
