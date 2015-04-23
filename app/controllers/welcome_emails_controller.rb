class WelcomeEmailsController < ApplicationController
  def show
  end

  def create
    @users = current_user

    UserMailer.welcome_email(@users).deliver_now

    flash[:notice] = "Welcome Email Sent!"

    redirect_to welcome_email_path
  end
end
