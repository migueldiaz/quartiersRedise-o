class JeunesController < ApplicationController
 layout 'mono'
 def index
      @web=Web.all.first    
     if @web.jeunes.nil?
       @web.jeunes=Jeunes.create
     end
    @jeunes=@web.jeunes 
    
    if @jeunes.sitio.nil?
     @jeunes.sitio=Sitio.new
    end      
       
    redirect_to sitio_path(@jeunes.sitio)   


 end
 
 def show
    @web=Web.all.first    
     if @web.jeunes.nil?
       @web.jeunes=Jeunes.create
     end
    @jeunes=@web.jeunes 
    
    if @jeunes.sitio.nil?
     @jeunes.sitio=Sitio.new
    end      
       
    redirect_to sitio_path(@jeunes.sitio)   
  end
end

