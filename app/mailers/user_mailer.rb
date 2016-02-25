class UserMailer < ApplicationMailer
  default from: "29.ishida@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.registration_confirmation.subject
  #
  def registration_confirmation
    @greeting = "Hi"

    mail to: "39.ishida@gmail.com"
  end
end
