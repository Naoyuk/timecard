class UserMailer < ApplicationMailer
  default from: ENV['MAIL_USER']

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.registration_confirmation.subject
  #
  def registration_confirmation(card, cost, to, cc)
    @greeting = "Hi"
    @card = card
    @cost = cost

    mail(
      to: to,
      cc: cc,
      subject: "#{card.date.to_s(:published_md)}タイムカード"
      )
  end
end
