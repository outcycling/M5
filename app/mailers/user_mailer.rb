class UserMailer < ApplicationMailer
    
    default from: "info@outcycling.org"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup.subject
  #
  def signup(email)
    
    @greeting = "Hi"

    mail to: email
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.daily_reading.subject
  #
  def daily_reading
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.daily_gratitude.subject
  #
  def daily_gratitude
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.photo_access.subject
  #
  def photo_access(requestor_email, name, requestor_id)
    @name = name
    @requestor_id = requestor_id
    mail to: requestor_email, subject: "Photo access request"
  end
end
