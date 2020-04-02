class CreateUsuarios < ActiveRecord::Migration[5.2]
  def change
    create_table :usuarios do |t|
      t.string :rfc
      t.string :curp
      t.string :nombre
      t.string :paterno
      t.string :materno
      t.string :edad
      t.string :telefono
      t.string :correo
      t.string :fecha_ncimiento
      t.string :sexo
      t.string :login
      t.string :password
      t.string :estado_id

      t.timestamps
    end
  end
end
