class AvisoMailer < ActionMailer::Base
  default :from => "donotreply@quartiersdumonde.org"
  
 # def aviso_foro(comentario)
 #   @comentario=comentario
 #   @foro=@comentario.foro
 #   @usuarios=@foro.comentarios.collect(&:usuarioforo).uniq
 #   #@correos=@usuarios.collect(&:email).uniq
 #   @usuarios.each do |usuario|
 #     @idioma=usuario.idioma
 #  	  mail(:to => usuario.email, :subject => @foro.tituloes)
 #   end
  #end
  def traductor(usuario) 
    mail(:to => usuario.email, :subject => "Nuevas traducciones en el sitio")
  end
  def error(url)
  @url=url
  mail(:to=>'juanantonioruz@gmail.com',:subject=>'Error 404 en QDM')
  end
  
    
  def notifica	
		@traductores=Usuario.find(:all,:conditions=>"tipo='traductor'" )   	 
		@traductores.each do |traductor|
			puts traductor.email
			AvisoMailer.traductor(traductor).deliver
	    end
	end

 
  def aviso_foro(usuario,comentario)
      I18n.locale = usuario.idioma
      @comentario=comentario
      @foro=comentario.foro;
      @email=usuario.email
      @usuario=usuario
      @idioma=usuario.idioma
   
      mail(:to => usuario.email, :subject =>t('foro')+@foro.tituloes)
  end
  
 
end
