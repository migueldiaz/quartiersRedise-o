class BusquedasController < ApplicationController
 layout 'quartiers'
 #helper :muestrapagina
 
 
 
 def index
    
      @buscadocumento=Documento.search do
   	   fulltext params[:search]
     end
     
     @buscaequipo=Equipo.search do
   	   fulltext params[:search]
     end
     @buscaparrafo=Parrafo.search do
   	   fulltext params[:search]
     end
     @buscapagina=Pagina.search do
   	   fulltext params[:search]
     end
     @equipos=@buscaequipo.results
     @paginas=@buscapagina.results
	 @parrafos=@buscaparrafo.results
	 @documentos=@buscadocumento.results
 end
end
