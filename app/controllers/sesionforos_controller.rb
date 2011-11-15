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
    tipo_f=session[:tipo_foro]
    if tipo_f=='femmes'
      usuarioforo=Usuarioforo.authenticate_femmes(params[:email],params[:password])
    else
        usuarioforo=Usuarioforo.authenticate_jeunes(params[:email],params[:password])
    end
   if usuarioforo
       session[:usuarioforo_id]=usuarioforo.id
       session[:usuarioforo_nombre]=usuarioforo.email
       logger.info("---------------------------------------------------------------")
       logger.info(I18n.locale)
       logger.info(usuarioforo.idioma)
       I18n.locale=usuarioforo.idioma
       logger.info(I18n.locale)
       logger.info("--------------------------///////////////////////////-------------------------------------")
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
