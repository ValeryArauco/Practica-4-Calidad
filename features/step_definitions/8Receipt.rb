Then(/^debería mostrarse que los datos de facturacion y envio coincidan con los ingresados$/) do |table|
    formulario = table.rows_hash

    within('body > table:nth-child(5) > tbody > tr:nth-child(1) > td > div > center > table > tbody') do
        #Validacion datos de la factura
        casillaName = find('tr:nth-child(1) > td:nth-child(2)').text
        casillaAddress = find('tr:nth-child(2) > td:nth-child(2)').text
        casillaCity = find('tr:nth-child(3) > td:nth-child(2)').text

        expect(casillaName).to eq(formulario["Name"])
        expect(casillaAddress).to eq(formulario["Address"])
        expect(casillaCity).to eq(formulario["City"]+", "+formulario["State"]+" "+formulario["Zip"])

        #Validacion datos de envio
        casillaName = find('tr:nth-child(1) > td:nth-child(5)').text
        casillaAddress = find('tr:nth-child(2) > td:nth-child(5)').text
        casillaCity = find('tr:nth-child(3) > td:nth-child(5)').text
        casillaPhone = find('tr:nth-child(4) > td:nth-child(5)').text

        expect(casillaName).to eq(formulario["Name"])
        expect(casillaAddress).to eq(formulario["Address"])
        expect(casillaCity).to eq(formulario["City"]+", "+formulario["State"]+" "+formulario["Zip"])
        expect(casillaPhone).to eq(formulario["Phone"])
    end

    #Validacion metodo de pago
    within('body > table:nth-child(5) > tbody > tr:nth-child(2) > td > table > tbody > tr > td > div > center > table') do
        casillaTarjeta = find('tr', text: "Method of Payment:").find('strong:nth-child(1)').text
    
        expect(casillaTarjeta).to eq(formulario["Method"])
    end
end


And(/^deberia mostrar los productos seleccionados$/) do |table|
    productos = table.hashes
    productos.each do |producto|
        within('body > table:nth-child(5) > tbody > tr:nth-child(2) > td > table > tbody > tr > td > div > center > table > tbody') do
            fila = find('tr', text: producto['Product'])
            expect(fila).to have_text(producto['Qty'])
            expect(fila).to have_text(producto['Status'])
            expect(fila).to have_text(producto['Unit Price'])
            expect(fila).to have_text(producto['Total Price'])
        end
    end
end


And('los detalles de precios deberian ser') do |table|
    detalles = table.rows_hash
    within('body > table:nth-child(5) > tbody > tr:nth-child(2) > td > table > tbody > tr > td > div > center > table') do
        productoTotal = find('tr', text: "Product Total").find('td:nth-child(3)').text
        salesTax = find('tr', text: "Sales Tax").find('td:nth-child(2)').text
        shipping = find('tr', text: "Shipping & Handling").find('td:nth-child(2)').text
        total = find('tr', text: "Grand Total").find('td:nth-child(2)').text
       
        expect(productoTotal).to eq(detalles["Product Total"])
        expect(salesTax).to eq(detalles["Sales Tax"])
        expect(shipping).to eq(detalles["Shipping & Handling"])
        expect(total).to eq(detalles["Grand Total"])
    end
end