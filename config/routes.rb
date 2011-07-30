Paginadocumentos::Application.routes.draw do

  match 'quartiers/asociacion/' => 'quartiers#asociacion'
  match 'quartiers/seccion/' => 'quartiers#seccion'
  match 'quartiers/colaborador/' => 'quartiers#colaborador'
  match 'quartiers/agenda/' => 'quartiers#agenda'
  match 'quartiers/contacto/' => 'quartiers#contacto'
  match 'quartiers/proyecto/' => 'quartiers#proyecto'
  match 'quartiers/equipos/' => 'quartiers#equipos'
  match 'quartiers/equipo/' => 'quartiers#equipo'


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
  
 
  resources :web do
    resources :asociacion
    resources :proyecto
    resources :equipos
  end
  
  
  resources :equipos
  resources :asociacion
  resources :reds
  resources :colaboradors
  resources :contactos
  resources :eventos
  resources :presentacions
  resources :web
  resources :proyecto
  
  
  resources :sitios do
    resources :usuarios
    resources:presentacion
    resources:contacto
    resources :red
    resources :colaboradors
    resources :eventos
   end
  
 
  resource :red do 
    resources :seccions
  end
  resource :presentacion do 
    resources :seccions
  end
 
  resources :seccions do
  resources :paginas
  resources :parrafos
  resources :documentos
end
  resources :paginas do
  resources :parrafos
  resources :documentos
 end
 resources :parrafos
 resources :documentos
 resources :seccions
 resources :paginas
 
 match 'quartiers/agenda/' => 'quartiers#agenda'
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
