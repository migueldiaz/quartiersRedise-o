class SesionesController < ApplicationController
  layout 'mono'
  
  def new
  
  end
  def create 
  usuario=Usuario.authenticate(params[:nombre],params[:password])
   if usuario
       session[:usuario_id]=usuario.id
       #redirect_to usuarios_path, :notice => 'Bienvenido'
       redirect_to trafico_url 
  
   else
    flash.now.alert = 'Revisar usuario y clave'
    render 'new'
   end 
  end
  def destroy
  session[:usuario_id] = nil
  redirect_to login_path, :notice => "Logged out!"
  end

end
