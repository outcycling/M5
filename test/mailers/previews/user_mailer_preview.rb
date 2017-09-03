# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/signup
  def signup
    UserMailer.signup
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/daily_reading
  def daily_reading
    UserMailer.daily_reading
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/daily_gratitude
  def daily_gratitude
    UserMailer.daily_gratitude
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/photo_access
  def photo_access
    UserMailer.photo_access
  end

end
