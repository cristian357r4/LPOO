#noinspection RubyInterpreter
class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]

  # GET /usuarios
  # GET /usuarios.json
  def index
    values = {}
    if params[:rfc].present?
      values[:rfc] = params[:rfc]
      
    end
    if params[:curp].present?
      values[:curp] = params[:curp]
      
    end
    if params[:nombre].present?
      values[:nombre] = params[:nombre]
      
    end
    if params[:paterno].present?
      values[:paterno] = params[:paterno]
      
    end
    if params[:materno].present?
      values[:materno] = params[:materno]
      
    end

      
    #@usuarios = Usuario.where(values)
    @usuarios = Usuario.where(values).paginate(:page => params[:page], :per_page => 2)
    

  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
    @estados = Estado.all

  end

  # GET /usuarios/new
  def new
    @usuario = Usuario.new
    @estados = Estado.all
  end

  # GET /usuarios/1/edit
  def edit
    @estados = Estado.all
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    @usuario = Usuario.new(usuario_params)
    
    respond_to do |format|
      if @usuario.save
        format.html { redirect_to @usuario, notice: 'Usuario was successfully created.' }
        format.json { render :show, status: :created, location: @usuario }
      else
        format.html { render :new }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update

    respond_to do |format|
      if @usuario.update(usuario_params)
        format.html { redirect_to @usuario, notice: 'Usuario was successfully updated.' }
        format.json { render :show, status: :ok, location: @usuario }
      else
        format.html { render :edit }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario.destroy
    respond_to do |format|
      format.html { redirect_to usuarios_url, notice: 'Usuario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def usuario_params
      params.require(:usuario).permit(:rfc, :curp, :nombre, :paterno, :materno, :edad, :telefono, :correo, :fecha_nacimiento, :sexo, :login, :password, :estado_id)
    end
end
