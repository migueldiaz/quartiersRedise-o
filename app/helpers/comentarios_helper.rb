module ComentariosHelper
 def nuevoscomentarios(identificador)
    
    @comentario=Comentario.find(identificador)
    @foro=@comentario.foro
    @comentarios=@foro.comentarios.all(:conditions => ["id > ?",identificador+1])
     return @comentarios
  	
  end
end
