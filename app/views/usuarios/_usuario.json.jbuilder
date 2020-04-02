json.extract! usuario, :id, :rfc, :curp, :nombre, :paterno, :materno, :edad, :telefono, :correo, :fecha_nacimiento, :sexo, :login, :password, :estado_id, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
