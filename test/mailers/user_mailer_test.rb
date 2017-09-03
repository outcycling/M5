require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "signup" do
    mail = UserMailer.signup
    assert_equal "Signup", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "daily_reading" do
    mail = UserMailer.daily_reading
    assert_equal "Daily reading", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "daily_gratitude" do
    mail = UserMailer.daily_gratitude
    assert_equal "Daily gratitude", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "photo_access" do
    mail = UserMailer.photo_access
    assert_equal "Photo access", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
