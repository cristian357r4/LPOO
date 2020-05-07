Rails.application.routes.draw do
  #get 'sesiones/login'
  #get 'paises/inicio'
  #get 'estados/inicio'
  resources :usuarios
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match '/estados' => 'estados#inicio', via: :get, :as => :estados_inicio
  match '/estado/nuevo' => 'estados#nuevo', via: :get, :as => :estado_nuevo
  match '/estado/guardar' => 'estados#crear', via: :post, :as => :estado_crear 
  match '/estado/:id/mostrar' => 'estados#mostrar' ,via: :get, :as => :mostrar_estado

  match '/estado/:id/editar' => 'estados#editar' ,via: :get, :as => :editar_estado
  match '/estado/actualizar' => 'estados#actualizar', via: :patch, :as => :actualizar_estado
  match '/estado/:id/eliminar' => 'estados#eliminar', via: :delete, :as => :eliminar_estado
  ##get post patch delete pregunta de examen


####################################################################################################
  match '/paises' => 'paises#inicio' , via: :get, :as => :paises_inicio
  match '/pais/nuevo' => 'paises#nuevo', via: :get, :as => :pais_nuevo  
  match '/pais/guardar' => 'paises#crear', via: :post, :as => :pais_crear 
  match '/pais/:id/mostrar' => 'paises#mostrar' ,via: :get, :as => :mostrar_pais

  match '/pais/:id/editar' => 'paises#editar' ,via: :get, :as => :editar_pais
  match '/pais/actualizar' => 'paises#actualizar', via: :patch, :as => :actualizar_pais
  match '/pais/:id/eliminar' => 'paises#eliminar', via: :delete, :as => :eliminar_pais



####################################################################################################
  match '/buscar_usuario' => 'usuarios#index', via: :post, :as => :buscar_usuario
  match '/buscar_estado' => 'estados#inicio', via: :post, :as => :buscar_estado
  match '/buscar_pais' => 'paises#inicio', via: :post, :as => :buscar_pais

####################################################################################################

  match '/login' => 'sesiones#login', via: :get, :as => :login
  match '/validar_usuario' => 'sesiones#validar_usuario', via: :post, :as => :validar_usuario
  match '/cerrar_sesion' => 'sesiones#cerrar_sesion', via: :get, :as => :cerrar_sesion

  root :to => 'sesiones#login' 
end
