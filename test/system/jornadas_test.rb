require "application_system_test_case"

class JornadasTest < ApplicationSystemTestCase
  setup do
    @jornada = jornadas(:one)
  end

  test "visiting the index" do
    visit jornadas_url
    assert_selector "h1", text: "Jornadas"
  end

  test "should create jornada" do
    visit jornadas_url
    click_on "New jornada"

    fill_in "Data", with: @jornada.data
    fill_in "Escala", with: @jornada.escala_id
    fill_in "Turno", with: @jornada.turno
    fill_in "User", with: @jornada.user_id
    click_on "Create Jornada"

    assert_text "Jornada was successfully created"
    click_on "Back"
  end

  test "should update Jornada" do
    visit jornada_url(@jornada)
    click_on "Edit this jornada", match: :first

    fill_in "Data", with: @jornada.data
    fill_in "Escala", with: @jornada.escala_id
    fill_in "Turno", with: @jornada.turno
    fill_in "User", with: @jornada.user_id
    click_on "Update Jornada"

    assert_text "Jornada was successfully updated"
    click_on "Back"
  end

  test "should destroy Jornada" do
    visit jornada_url(@jornada)
    click_on "Destroy this jornada", match: :first

    assert_text "Jornada was successfully destroyed"
  end
end
