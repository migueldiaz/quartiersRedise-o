class SesionforosController < ApplicationController
  layout 'juan_jeunes'
  
  def segun_proyecto
    if @usuarioforo.jeunes.nil?
    render :layout => 'juan_femmes'
    end
 end

  
  def new
  
  end
 
  def create 

  usuarioforo=Usuarioforo.authenticate(params[:email],params[:password])
   if usuarioforo
       session[:usuarioforo_id]=usuarioforo.id
       I18n.locale=usuarioforo.idioma
       if !usuarioforo.jeunes.nil?

        registrado=['jeunes', 'jeune', 'joven', 'jove'].include? params[:password]
         if(registrado) 
            redirect_to jeunes_foros_path
          else
          salida
          end
      
    elsif !usuarioforo.femmes.nil?
              registrado=['femmes', 'femme', 'mujer', 'dona'].include? params[:password]
         if(registrado) 
         redirect_to femmes_foros_path
          else
          salida
          end

       end
   else
    salida
  end
  end
  
  def salida
    usuarioforo=nil;
    session[:usuarioforo_id]=nil;
      flash.now.alert = t('revisardatos')
    #render 'new'
      if session[:tipo_foro]=='jeunes'
          redirect_to jeunes_acceso_path
      else
        redirect_to femmes_acceso_path
      end 
    end



  def destroy
    @usuarioforo=Usuarioforo.find(session[:usuarioforo_id])
    path=jeunes_acceso_path
     if @usuarioforo.jeunes.nil?
       path=femmes_acceso_path
    end
  session[:usuarioforo_id] = nil
  redirect_to path, :notice => t('desconectado')
  end

end
