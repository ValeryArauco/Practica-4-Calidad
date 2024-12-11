When(/^Lleno las casillas para factura en "([^"]*)"$/) do |casilla,table|
    informacion = table.rows_hash
    @formulario = FacturationForm.new
    @formulario.llenar_form(casilla, informacion)
end

When(/^Lleno las casillas de tarjeta$/) do |table|
    informacion = table.rows_hash
    @formulario.llenar_form_tarjeta(informacion)
end

When(/^Hago click en la casilla "Same as Bill To"$/) do
    @formulario.click_button_SameAsBillTo()
end


Then(/^deberia tener los mismos datos en la casillas de Ship To$/) do |table|
    formulario = table.rows_hash
    expect(@formulario.shipName.value).to eq(formulario["Name"])
    expect(@formulario.shipAddress.value).to eq(formulario["Address"])
    expect(@formulario.shipCity.value).to eq(formulario["City"])
    expect(@formulario.shipState.value).to eq(formulario["State"])
    expect(@formulario.shipZipCode.value).to eq(formulario["Zip"])
    expect(@formulario.shipPhone.value).to eq(formulario["Phone"])
end

And(/^ingreso cantidades validas a ordenar para los items$/) do |table|
    within('body > form > table > tbody > tr:nth-child(2) > td > div > center > table') do
      table.hashes.each do |row|
        item = row['item']
        cantidad = row['cantidad']
        item_row = find('tr', text: item)
        item_row.find('input[type="text"]').set(cantidad)
      end
    end
end

When(/^cambio el "([^"]*)" en la "([^"]*)" de "([^"]*)"$/) do |valor,casilla,tipo|
    @formulario.cambio_Valor_Casilla(tipo,casilla,valor)
end


Then(/^deberia mostrarme una alerta de invalidacion de la "([^"]*)"$/) do |casilla|
    expect(page.driver.browser.switch_to.alert.text).to eq(@formulario.msj_error(casilla))
end
