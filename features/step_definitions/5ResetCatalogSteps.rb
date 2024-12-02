# Paso para ingresar cantidades válidas para los items
When(/^ingreso las cantidades para los items$/) do |table|
    within('body > form > table > tbody > tr:nth-child(2) > td > div > center > table') do
      table.hashes.each do |row|
        item = row['item']
        cantidad = row['cantidad']
        item_row = find('tr', text: item)
        item_row.find('input[type="text"]').set(cantidad)
      end
    end
end
  

# Paso para hacer clic en un botón específico
When(/^hago click sobre el botón "(.*)"$/) do |button_text|
    click_button(button_text)
end

# Paso para verificar que todas las cantidades se reinician a cero
Then(/^verifico que las cantidades se reinicien a cero para los items$/) do |table|
within('body > form > table > tbody > tr:nth-child(2) > td > div > center > table') do
    table.hashes.each do |row|
    item = row['item']
    item_row = find('tr', text: item)
    actual_value = item_row.find('input[type="text"]').value
    expect(actual_value).to eq('0')
    end
end
end