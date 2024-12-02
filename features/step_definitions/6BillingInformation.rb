When(/^Lleno las casillas para factura en "([^"]*)"$/) do |casilla,table|
    esBillTo = 0
    informacion = table.rows_hash
    if(casilla == "Bill To")
        name = '[name="billName"]'
        address = '[name="billAddress"]'
        city = '[name="billCity"]'
        state = '[name="billState"]'
        zip = '[name="billZipCode"]'
        phone = '[name="billPhone"]'
        casillaEmail = find('input[name="billEmail"]').set(informacion["E-mail"])
    elsif(casilla == "Ship To")
        name = '[name="shipName"]'
        address = '[name="shipAddress"]'
        city = '[name="shipCity"]'
        state = '[name="shipState"]'
        zip = '[name="shipZipCode"]'
        phone = '[name="shipPhone"]'
    end
    casillaName = find('input'+name).set(informacion["Name"])
    casillaAddress = find('input'+address).set(informacion["Address"])
    casillaCity = find('input'+city).set(informacion["City"])
    casillaState = find('input'+state).set(informacion["State"])
    casillaZip = find('input'+zip).set(informacion["Zip"])
    casillaPhone = find('input'+phone).set(informacion["Phone"])
end

When(/^Selecciono el tipo de tarjeta "([^"]*)"$/) do |tipo|
    if(tipo == "American Express")
        valor = "AMEX"
    elsif(tipo == "MasterCard")
        valor = "MasterCard"
    elsif(tipo == "Visa")
        valor = "Visa"
    end
    find("[name='CardType']").find("option[value='#{valor}']").select_option
end

When(/^Ingreso mi numero de tarjeta "([^"]*)"$/) do |numero|
    find('input[name="CardNumber"]').set(numero)
end

When(/^Ingreo la fecha de expiracion de mi tarjeta "([^"]*)"$/) do |fecha|
    find('input[name="CardDate"]').set(fecha)
end
