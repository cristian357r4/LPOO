class PaisesController < ApplicationController
	def inicio
    values = {}
    if params[:nombre].present?
      values[:nombre] = params[:nombre]
      
    end
    if params[:descripcion].present?
      values[:descripcion] = params[:descripcion]
      
    end    
      
    #@estados = Estado.where(values).paginate(:page => params[:page], :per_page => 2)
  	@paises = Pais.where(values).paginate(:page => params[:page], :per_page => 2)
  end
  
  def nuevo
  	@pais = Pais.new
  end

  def crear
  	@pais = Pais.new(nombre: params[:pais][:nombre], descripcion: params[:pais][:descripcion])

  	respond_to do |format|
  		if @pais.save
  			format.html { redirect_to mostrar_pais_path(@pais.id), notice: 'Pais Creado exitosamente.' }

  		end
  	end
  end

  def mostrar
  	@pais = Pais.find(params[:id])
  end

  def editar
  	@pais = Pais.find(params[:id])
  end

  def actualizar
    @pais = Pais.find(params[:pais][:id])
    #@estado = Estado.update(nombre: params[:estado][:nombre], descripcion: params[:estado][:descripcion], pais_id: params[:estado][:pais_id])

    respond_to do |format|
      if @pais.update(params.require(:pais).permit(:nombre, :descripcion))
        format.html { redirect_to mostrar_pais__path(@pais.id), notice: 'Estado actualizado exitosamente.' }
        
      end
    end
  end
  
  def eliminar
    @pais = Pais.find(params[:id])
    respond_to do |format|
      if @pais.destroy
        format.html { redirect_to paises_inicio_path, alert: 'Pais Eliminado Exitosamente.' }
        
      end
    end

  end
end
