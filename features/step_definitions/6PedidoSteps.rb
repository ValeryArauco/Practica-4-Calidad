When(/^verifico que el Grand Total sea correcto con un valor esperado de "(.*)"$/) do |expected_value|
  product_rows_xpath = '/html/body/form/table/tbody/tr[1]/td/div/center/table/tbody/tr'
  all_rows = all(:xpath, product_rows_xpath)

  product_rows = all_rows.select do |row|
    row.all('td').count >= 5 && row.find('td:first-child').text.strip.match?(/^\d+$/)
  end

  subtotal = product_rows.sum do |row|
    quantity = row.find('td:nth-child(1)').text.strip.to_i
    unit_price = row.find('td:nth-child(4)').text.strip.gsub(/[^\d.]/, '').to_f
    quantity * unit_price
  end

  # Calcular Sales Tax (5%)
  sales_tax = (subtotal * 0.05).round(2)
  shipping_handling = 5.00

  # Calcular Grand Total
  grand_total = (subtotal + sales_tax + shipping_handling).round(2)

  expected_total = expected_value.gsub(/[^\d.]/, '').to_f

  expect(grand_total).to eq(expected_total), "Grand Total incorrecto: esperado #{expected_total}, obtenido #{grand_total}"
end

Then(/^hago click en "Proceed with Order"$/) do
    click_button("bSubmit")
end