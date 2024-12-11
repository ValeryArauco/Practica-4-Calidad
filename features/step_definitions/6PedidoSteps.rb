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

When(/^presiono la tecla "Enter"$/) do
  begin
    cantidad_input = find('input[type="text"]', match: :first, visible: true)
    cantidad_input.send_keys(:enter)
    sleep(1)
    begin
      alert = page.driver.browser.switch_to.alert
      if alert
        puts "Alerta detectada: #{alert.text}"
        alert.accept
      end
    rescue => e
      puts "No se detectó alerta: #{e.message}"
    end
  rescue => e
    puts "Error al presionar Enter: #{e.message}"
    raise
  end
end

Then(/^hago click en "Proceed with Order"$/) do
    click_button("bSubmit")
end

Then(/^verifico que todos los productos tengan estado "([^"]*)"$/) do |expected_status|
  product_rows_xpath = "/html/body/form/table/tbody/tr[1]/td/div/center/table/tbody/tr"
  product_rows = all(:xpath, product_rows_xpath)
  
  valid_product_rows = product_rows.select do |row|
    row.all('td').count >= 5 && row.find('td:first-child').text.strip.match?(/^\d+$/)
  end
  
  delivery_statuses = valid_product_rows.map do |row|
    status_cell = row.find(:xpath, ".//td[3]")
    status_cell.text.strip
  end

  # Comprobar que todos los estados son iguales al esperado
  delivery_statuses.each_with_index do |status, index|
    expect(status).to eq(expected_status), 
      "El estado de envío del producto #{index + 1} ('#{status}') no coincide con '#{expected_status}'"
  end
end

