Paginadocumentos::Application.routes.draw do

  get "desconectar" => "sesionforos#destroy", :as => "desconectar"
  get 'registroforo'=>"usuarioforos#new",:as=>'registroforo'
  get 'loginforo' => 'sesionforos#new', :as => 'loginforo'
  resources :sesionforos
  resources :claves
  resources :comentarios
  resources :usuarioforos
  resources :fondos
  resources :seccions
  resources :busquedas
  get "foro/clave" => "claves#edit", :as => "foro/clave"
  resources :foros
  match 'contacto/correo/' => 'contactos#correo'
  ################################################
  match 'quartiers/asociacion/' => 'quartiers#asociacion'
  match 'quartiers/seccion/' => 'quartiers#seccion'
  match 'quartiers/colaborador/' => 'quartiers#colaborador'
  match 'quartiers/agenda/' => 'quartiers#agenda'
  match 'quartiers/contacto/' => 'quartiers#contacto'
  match 'quartiers/proyecto/' => 'quartiers#proyecto'
  match 'quartiers/equipos/' => 'quartiers#equipos'
  match 'quartiers/equipo/' => 'quartiers#equipo'
  ##############################################
  match 'equipe/presentacion'=> 'equipe#presentacion'
  match 'equipe/proyectos'=> 'equipe#proyectos'
  match 'equipe/pagina'=> 'equipe#pagina'
  match 'equipe/colaboradores'=> 'equipe#colaborador'
  match 'equipe/agenda'=> 'equipe#agenda'
  match 'equipe/actividades'=> 'equipe#actividades'
  match 'equipe/contacto'=> 'equipe#contacto'
  match 'equipe/sitio'=> 'equipe#sitio'
  
  #############################3
   match '/jeunes/'=> 'jeunes#presentacion'
   match 'jeunes/acceso' => 'jeunes#acceso'
  match 'jeunes/documentacion' => 'jeunes#documentacion'
  match 'jeunes/sitio' => 'jeunes#sitio'
  match 'jeunes/foros' => 'jeunes#foros'
  match 'jeunes/foro' => 'jeunes#foro'
  match 'jeunes/presentacion'=> 'jeunes#presentacion'
  match 'jeunes/pagina'=> 'jeunes#pagina'
  match 'jeunes/colaborador'=> 'jeunes#colaborador'
  match 'jeunes/agenda'=> 'jeunes#agenda'
  match 'jeunes/proyectos'=> 'jeunes#proyectos'
  match 'jeunes/equipos'=> 'jeunes#equipos'
  match 'jeunes/equipo'=> 'jeunes#equipo'
  match 'jeunes/contacto'=> 'jeunes#contacto'
  ###################################################
   match '/femmes/'=> 'femmes#presentacion'
   match 'femmes/acceso' => 'femmes#acceso'
  match 'femmes/documentacion' => 'femmes#documentacion'
  match 'femmes/sitio' => 'femmes#sitio'
  match 'femmes/foros' => 'femmes#foros'
  match 'femmes/foro' => 'femmes#foro'
  match 'femmes/presentacion'=> 'femmes#presentacion'
  match 'femmes/pagina'=> 'femmes#pagina'
  match 'femmes/colaborador'=> 'femmes#colaborador'
  match 'femmes/agenda'=> 'femmes#agenda'
  match 'femmes/proyectos'=> 'femmes#proyectos'
  match 'femmes/equipos'=> 'femmes#equipos'
  match 'femmes/equipo'=> 'femmes#equipo'
  match 'femmes/contacto'=> 'femmes#contacto'
  ################################################
  match '/asociation/'=> 'asociation#presentacion'
  match 'asociation/presentacion'=> 'asociation#presentacion'
  match 'asociation/pagina'=> 'asociation#pagina'
  match 'asociation/colaborador'=> 'asociation#colaborador'
  match 'asociation/agenda'=> 'asociation#agenda'
  match 'asociation/proyectos'=> 'asociation#proyectos'
  match 'asociation/contacto'=> 'asociation#contacto'
  ######################
  match 'idioma/spanish'=> 'idioma#setspanish'
  match 'idioma/french'=> 'idioma#setfrench'
  
  

  root :to => "quartiers#index"
  get 'login' => 'sesiones#new', :as => 'login'
  get 'traductor' => 'traductor#index', :as => 'traductor'
  get 'trafico' => 'trafico#dirige', :as => 'trafico'
  get "log_out" => "sesiones#destroy", :as => "log_out"
  get "registro" => "usuarios#new", :as => "registro"
  #match 'admin' => 'web#index'
  #get 'admin' => 'web#index',:as => "admin"
  get 'admin' => 'web#show',:as => "admin"
  #get 'asociacion' => 'asociacion#show',:as => "asociacion"
  


  resources :usuarios
  resources :sesiones
  resources:jeunes do
   resources :sitio
  end
  resources :foro do
    resources :comentarios
  end
  
  resources :comentarios do
   resources:comentarios
  end
  
  resources :comentarios
  resources :web do
    resources :asociacion
    resources :equipos
    resources :jeunes
    resources :femmes
  end
  resources :foros
  resources :femmes
  resources :jeunes
  resources :equipos
  resources :asociacion
  resources :reds
  resources :colaboradors
  resources :contactos
  resources :eventos
  resources :presentacions
  resources :web
  resources :proyecto
  resources :sitios
  resources :documentacions
  resources :sitios do
    resources :documentacion
    resources :usuarios
    resources :presentacion
    resources:contacto
    resources :red
    resources :colaboradors
    resources :eventos
    resources :foros
   end
  
  resource :documentacion do 
    resources :paginas
 end
  resource :red do 
    resources :paginas
  end
  resource :presentacion do 
    resources :paginas
  end
  resources :imagens
  resources :paginas do
  resources :imagens
  resources :parrafos
  resources :documentos
  resources:paginas 
 end
 resources :parrafos
 resources :documentos
 
 resources :paginas
 
 resources :quartiers
   

  #match '/quartiers/agenda', :controller => 'quartiers', :action => 'agenda'

 
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
