Rails.application.routes.draw do
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


end
