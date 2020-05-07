class SesionesController < ApplicationController
  layout 'application_login'
  skip_before_action :login?, only: [:login,:validar_usuario]
  def login
  ##params , flash y session 
  end
  def validar_usuario
  	@usuario = Usuario.select('id,nombre,paterno,materno,login,password')
  						.where('login = ? and password = ?', params[:login], params[:password]).first


  	if @usuario.nil?
  		validar = false
  	else
  		validar = true
      session[:usuario_id] = @usuario.id
      session[:nombre] = @usuario.nombre+''+@usuario.paterno+''+@usuario.materno
  	end

  	respond_to do |format|

  		if validar
  			flash[:notice] = 'Bienvenido ' + session[:nombre]
  			format.html{ redirect_to usuarios_path}
  		else
  			flash[:alert] = 'Usuario/password no valido.'
			format.html{ redirect_to login_path}  		
  		end
  	end
  end

  def cerrar_sesion
    session[:usuario_id] = nil
    session[:nombre] = nil
    respond_to do |format|
      flash[:alert] = 'Sesion finalizada.'
      format.html{redirect_to login_path}
    end
    
  end

end