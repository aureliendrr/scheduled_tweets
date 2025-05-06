class PasswordResetController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user
      PasswordMailer.with(user: @user).reset.deliver_later
    end

    redirect_to root_path, notice: "If an account with that email exists, a password reset link has been sent."
  end

  def edit
    @user = User.find_signed!(params[:token], purpose: "password_reset")
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to root_path, alert: "Your password reset link is invalid or has expired."
  end

  def update
    @user = User.find_signed!(params[:token], purpose: "password_reset")
    if @user.update(password_params)
      redirect_to root_path, notice: "Your password has been reset successfully. Please sign in."
    else
      flash[:alert] = "Error updating password: #{@user.errors.full_messages.join(", ")}"
      render :edit, status: :unprocessable_entity
    end
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to root_path, alert: "Your password reset link is invalid or has expired."
  end

  private
  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
