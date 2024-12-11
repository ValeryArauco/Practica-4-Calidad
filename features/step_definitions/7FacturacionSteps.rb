When(/^Lleno las casillas para factura en "([^"]*)"$/) do |casilla,table|
    informacion = table.rows_hash
    @formulario = FacturationForm.new
    @formulario.llenar_form(casilla, informacion)
end

When(/^Lleno las casillas de tarjeta$/) do |table|
    informacion = table.rows_hash
    if(informacion["Credit Card"] == "American Express")
        valor = "AMEX"
    elsif(informacion["Credit Card"] == "MasterCard")
        valor = "MasterCard"
    elsif(informacion["Credit Card"] == "Visa")
        valor = "Visa"
    end
    find("[name='CardType']").find("option[value='#{valor}']").select_option
    find('input[name="CardNumber"]').set(informacion["Card Number"])
    find('input[name="CardDate"]').set(informacion["Expiration"])
end

When(/^Hago click en la casilla "Same as Bill To"$/) do
    check('shipSameAsBill')
end


Then(/^deberia tener los mismos datos en la casillas de Ship To$/) do |table|
    formulario = table.rows_hash

    casillaName = find('input[name="shipName"]').value
    casillaAddress = find('input[name="shipAddress"]').value
    casillaCity = find('input[name="shipCity"]').value
    casillaState = find('input[name="shipState"]').value
    casillaZip = find('input[name="shipZipCode"]').value
    casillaPhone = find('input[name="shipPhone"]').value

    expect(casillaName).to eq(formulario["Name"])
    expect(casillaAddress).to eq(formulario["Address"])
    expect(casillaCity).to eq(formulario["City"])
    expect(casillaState).to eq(formulario["State"])
    expect(casillaZip).to eq(formulario["Zip"])
    expect(casillaPhone).to eq(formulario["Phone"])
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
    ubiCasillas = {
        "Bill" => {
            "Name" => '[name="billName"]',
            "Address" => '[name="billAddress"]',
            "City" => '[name="billCity"]',
            "State" => '[name="billState"]',
            "Zip" => '[name="billZipCode"]',
            "Phone" => '[name="billPhone"]',
            "E-mail" => '[name="billEmail"]',
            "Card Number" => '[name="CardNumber"]',
            "Expiration" => '[name="CardDate"]'
        },               
        "Ship" => {
            "Name" => '[name="shipName"]',               
            "Address" => '[name="shipAddress"]',             
            "City" => '[name="shipCity"]',                
            "State" => '[name="shipState"]',               
            "Zip" => '[name="shipZipCode"]',
            "Phone" => '[name="shipPhone"]',
        }
    }
    find('input'+ubiCasillas[tipo][casilla]).set(valor)
end


Then(/^deberia mostrarme una alerta de invalidacion de la "([^"]*)"$/) do |casilla|
    errores = {"Phone" => "phone number", 
                "Zip" => "zip code", 
                "Card Number" => "card number of the form '1234-123456-12345'",
                "Expiration" => "date of the form 'MM/YY'"}
    if(!errores.has_key?(casilla))
        message = "please enter only letters"
    else
        message = "Please enter a valid " + errores[casilla] + " in this field."
    end
    expect(page.driver.browser.switch_to.alert.text).to eq(message)
end
