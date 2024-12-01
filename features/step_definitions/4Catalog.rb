When(/^hago click en "Enter GMO OnLine"$/) do
    click_button('bSubmit')
end
  
Then('veo la lista de items') do |table|
    expected_items = table.raw.to_h { |row| [row[0], { name: row[1], price: row[2], quantity: row[3] }] } 

    within('body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody') do
      rows = all('tr')
      rows.each_with_index do |row, index|
        next if index == 0 # Ignorar encabezados
  
        item_number = row.all('td')[0].text.strip
        item_name = row.all('td')[1].text.strip
        item_price = row.all('td')[2].text.strip
        order_quantity = row.all('td')[3].find('input').value.strip
  
        expect(expected_items[item_number][:name]).to eq(item_name)
        expect(expected_items[item_number][:price]).to eq(item_price)
        expect(expected_items[item_number][:quantity]).to eq(order_quantity)
      end
    end
  end
