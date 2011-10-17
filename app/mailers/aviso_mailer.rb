class AvisoMailer < ActionMailer::Base
  default :from => "no-reply@quartiersdumonde.org"
  
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
  def aviso_foro(usuario,comentario)
      @comentario=comentario
      @foro=comentario.foro;
      @email=usuario.email
      @usuario=usuario
      @idioma=usuario.idioma
      
      mail(:to => usuario.email, :subject => "Nueva actividad en "+@foro.tituloes)
  end
end
