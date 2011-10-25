class WebController < ApplicationController
  layout 'mono' 
  before_filter :require_admin
  def index
    
  end

  def show
      @web=Web.all.first    
      if @web.nil?
       @web=Web.create
     else  
       @web=Web.all.first    
     end

     if @web.asociacion.nil?
       @web.asociacion=Asociacion.create
     end
     if @web.jeunes.nil?
       @web.jeunes=Jeunes.create
     end
     if @web.femmes.nil?
       @web.femmes=Femmes.create
     end
    
    
  end
end
