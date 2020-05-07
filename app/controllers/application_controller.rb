class ApplicationController < ActionController::Base
	before_action :login?
	#aqui se ejecutan los metodos antes de cualquier otra cosa

	def login?
		redirect_to login_path, alert: "Debes Iniciar Sesion." if session[:usuario_id].nil?
					
	end


end
