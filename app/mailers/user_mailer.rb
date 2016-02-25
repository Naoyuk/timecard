class UserMailer < ApplicationMailer
  default from: "29.ishida@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.registration_confirmation.subject
  #
  def registration_confirmation(card)
    @greeting = "Hi"
    @card = card

    mail(
      to: "39.ishida@gmail.com",
      cc: "39.ishida@gmail.com",
      subject: "#{card.date.to_s(:published_md)}タイムカード"
      )
  end
end
