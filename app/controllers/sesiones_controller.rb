class SesionesController < ApplicationController
  layout 'mono'
  
  def new
  
  end
  def create 
  usuario=Usuario.authenticate(params[:nombre],params[:password])
   if usuario
       session[:usuario_id]=usuario.id
     
       if usuario.tipo=='traductor'
          redirect_to traductor_url
       elsif usuario.tipo=='admin'
           redirect_to admin_path
       else
           redirect_to usuario.sitio
       end
   else
    flash.now.alert = t('revisardatos')
    render 'new'
   end 
  end
  def destroy
  session[:usuario_id] = nil
  redirect_to login_path, :notice => t('desconectado')
  end

end
