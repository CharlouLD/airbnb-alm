class UserMailer < ApplicationMailer
  default from: 'team@airbnb-alm.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @user = user  # Instance variable => available in view

    mail(to: @user.email, subject: 'Welcome to AirBnB')
  end

  # TODO Add here a methode
end
