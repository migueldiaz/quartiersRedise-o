class ContactoMailer < ActionMailer::Base
   default from: "donotreply@quartiersdumonde.org"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contacto_mailer.contacto.subject
  #
  def contactar(email)
 	 @email=email
 	 mail(:to=>email.destino,:subject => "Contacto formulario web")
  end

  
end

