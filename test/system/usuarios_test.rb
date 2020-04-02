require "application_system_test_case"

class UsuariosTest < ApplicationSystemTestCase
  setup do
    @usuario = usuarios(:one)
  end

  test "visiting the index" do
    visit usuarios_url
    assert_selector "h1", text: "Usuarios"
  end

  test "creating a Usuario" do
    visit usuarios_url
    click_on "New Usuario"

    fill_in "Correo", with: @usuario.correo
    fill_in "Curp", with: @usuario.curp
    fill_in "Edad", with: @usuario.edad
    fill_in "Estado", with: @usuario.estado_id
    fill_in "Fecha ncimiento", with: @usuario.fecha_ncimiento
    fill_in "Login", with: @usuario.login
    fill_in "Materno", with: @usuario.materno
    fill_in "Nombre", with: @usuario.nombre
    fill_in "Password", with: @usuario.password
    fill_in "Paterno", with: @usuario.paterno
    fill_in "Rfc", with: @usuario.rfc
    fill_in "Sexo", with: @usuario.sexo
    fill_in "Telefono", with: @usuario.telefono
    click_on "Create Usuario"

    assert_text "Usuario was successfully created"
    click_on "Back"
  end

  test "updating a Usuario" do
    visit usuarios_url
    click_on "Edit", match: :first

    fill_in "Correo", with: @usuario.correo
    fill_in "Curp", with: @usuario.curp
    fill_in "Edad", with: @usuario.edad
    fill_in "Estado", with: @usuario.estado_id
    fill_in "Fecha ncimiento", with: @usuario.fecha_ncimiento
    fill_in "Login", with: @usuario.login
    fill_in "Materno", with: @usuario.materno
    fill_in "Nombre", with: @usuario.nombre
    fill_in "Password", with: @usuario.password
    fill_in "Paterno", with: @usuario.paterno
    fill_in "Rfc", with: @usuario.rfc
    fill_in "Sexo", with: @usuario.sexo
    fill_in "Telefono", with: @usuario.telefono
    click_on "Update Usuario"

    assert_text "Usuario was successfully updated"
    click_on "Back"
  end

  test "destroying a Usuario" do
    visit usuarios_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Usuario was successfully destroyed"
  end
end
