class UserMailer < ActionMailer::Base
  default from: "localservices@gmail.com"

  def welcome_email(user)
  	@user = user
    @greeting = "Hi #{user.email}"
    @service_types = ServiceType.all

    mail to: 'syed.rab@gmail.com', subject: "You so awesome!"
  end
end