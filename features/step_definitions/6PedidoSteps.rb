When(/^verifico que el Grand Total sea correcto$/) do
  product_rows_xpath = '/html/body/form/table/tbody/tr[1]/td/div/center/table/tbody/tr'
  grand_total_xpath = find(:xpath, "/html/body/form/table/tbody/tr[1]/td/div/center/table/tbody/tr[last()]/td[2]")

  page_grand_total = grand_total_xpath.text.gsub(/[^\d.]/, '').to_f

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

  # Calcular Grand Total calculado
  calculated_grand_total = (subtotal + sales_tax + shipping_handling).round(2)

  # Comparar el Grand Total de la página con el calculado
  expect(page_grand_total).to eq(calculated_grand_total), "Grand Total incorrecto: #{page_grand_total}, calculado #{calculated_grand_total}"
end

Then(/^hago click en "Proceed with Order"$/) do
    click_button("bSubmit")
end

# Recomendaciones ->Juanpi

# ENTRE TODOS

# - INVESTIGAR SMOKE TEST 
# - AÑADIR MAS ESCENARIOS SI ES POSIBLE A NUESTROS ARCHIVOS
# - OPCIONAL : AÑADIR OBJECT MODEL A NUESTROS ARCHIVOS