class EstadosController < ApplicationController
  def inicio
    values = {}
    if params[:nombre].present?
      values[:nombre] = params[:nombre]
      
    end
    if params[:descripcion].present?
      values[:descripcion] = params[:descripcion]
      
    end
    if params[:pais].present?
      values[:pais] = params[:pais]
      
    end
      
    @estados = Estado.where(values).paginate(:page => params[:page], :per_page => 2)
  end
  
  def nuevo
  	@estado = Estado.new #visible desde la vista invocando igual @estado
  	#estado variable local
  	#@estado variable de instancia
  	#@@estado variable de clas
  end
  
  def crear
  	#revisar la forma en la que se define la variable usuario_params en usuarios_controller.rb
  	@estado = Estado.new(nombre: params[:estado][:nombre], descripcion: params[:estado][:descripcion], pais_id: params[:estado][:pais_id])

    respond_to do |format|
      if @estado.save
        format.html { redirect_to mostrar_estado_path(@estado.id), notice: 'Estado Creado exitosamente.' }
        
      end
    end
  end

  def mostrar
    @estado = Estado.find(params[:id])
  end

  def editar
    @estado = Estado.find(params[:id])
  end

  def actualizar
    @estado = Estado.find(params[:estado][:id])
    #@estado = Estado.update(nombre: params[:estado][:nombre], descripcion: params[:estado][:descripcion], pais_id: params[:estado][:pais_id])

    respond_to do |format|
      if @estado.update(params.require(:estado).permit(:nombre, :descripcion, :pais_id))
        format.html { redirect_to mostrar_estado_path(@estado.id), notice: 'Estado actualizado exitosamente.' }
        
      end
    end
  end
  
  def eliminar
    @estado = Estado.find(params[:id])
    respond_to do |format|
      if @estado.destroy
        format.html { redirect_to estados_inicio_path, alert: 'Estado Eliminado Exitosamente.' }
        
      end
    end

  end

end
