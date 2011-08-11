class ContactoMailer < ActionMailer::Base
  default :from => "qdm@quartiersumonde.org"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contacto_mailer.contacto.subject
  #
  def contacto
    @greeting = t('subject')
    
    mail :to => "to@example.org"
    mail :body=>""
  end
end
