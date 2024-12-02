Then(/^veo la lista de items$/) do |table|
  items = table.raw.flatten
  within('body > form > table > tbody > tr:nth-child(2) > td > div > center > table') do
    rows = all('tr')
    rows.each_with_index do |row, index|
      next if index == 0 
      item_name = row.all('td')[1].text.strip
      expect(items).to include(item_name)
    end
  end
end

When(/^ingreso una "(.*)" en el campo "Order Quantity" para un "(.*)"$/) do |cantidad, item|
  within('body > form > table > tbody > tr:nth-child(2) > td > div > center > table') do
    row = find('tr', text: item)
    row.find('input[type="text"]').set(cantidad)
  end
end

When(/^hago click sobre el boton "(.*)"$/) do |button_text|
  click_button(button_text)
end

Then(/^soy redirigido a la página "(.*)"$/) do |page_name|
  expect(page).to have_content(page_name)
end


Then(/^el sistema me muestra la advertencia "(.*)"$/) do |message|
  page.driver.browser.switch_to.alert.text == message
  page.driver.browser.switch_to.alert.accept
end