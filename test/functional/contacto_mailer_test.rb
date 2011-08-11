require 'test_helper'

class ContactoMailerTest < ActionMailer::TestCase
  test "contacto" do
    mail = ContactoMailer.contacto
    assert_equal "Contacto", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
