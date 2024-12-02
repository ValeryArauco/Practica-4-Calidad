Then(/^verifico que el precio total calculado es correcto$/) do
    # Encontrar todas las filas de productos dinámicamente
    product_rows_xpath = '/html/body/form/table/tbody/tr[1]/td/div/center/table/tbody/tr'
    
    # Encontrar todas las filas de productos, excluyendo posibles headers o filas de totales
    all_rows = all(:xpath, product_rows_xpath)
    
    # Filtrado de filas
    product_rows = all_rows.select do |row|
      row.all('td').count >= 5 &&
      row.find('td:first-child').text.strip.match?(/^\d+$/)
    end
  
    product_rows.each_with_index do |row, index|
      begin
        # Construir XPath dinámico para cada fila
        row_xpath = "#{product_rows_xpath}[#{index + 2}]"
  
        # Extraer cantidad
        quantity = find(:xpath, "#{row_xpath}/td[1]").text.strip.to_i
        
        # Extraer precio unitario
        unit_price_text = find(:xpath, "#{row_xpath}/td[4]").text.strip
        unit_price = unit_price_text.gsub(/[^\d.]/, '').to_f
        
        # Extraer precio total
        total_price_text = find(:xpath, "#{row_xpath}/td[5]").text.strip
        total_price = total_price_text.gsub(/[^\d.]/, '').to_f
  
        # Calcular el total esperado
        expected_total = (quantity * unit_price).round(2)
  
        # Verificar que el total calculado coincida con el total mostrado
        expect(total_price).to eq(expected_total)
    end
    puts "Verificación de precios completada para #{product_rows.count} productos"
  end
end


Then(/^verifico que se muestre los costos respectivos$/) do |table|
    table.hashes.each do |row|
      field = row['field']
      expected_price = row['expected_value']
  
      # XPath para encontrar filas de totales
      total_rows_xpath = '/html/body/form/table/tbody/tr[1]/td/div/center/table/tbody/tr'
      
      # Buscar la fila correspondiente al campo
      cost_row = all(:xpath, total_rows_xpath).find do |tr| 
        tr.text.include?(field)
      end
      
      # Extraer el precio actual, manejando múltiples formatos
      actual_price_text = cost_row.find('td:last-child').text.strip
      
      # Comparar precios, ignorando el símbolo de moneda
      expect(actual_price_text).to eq(expected_price)
    end
end

When(/^hago click en "Proceed with Order"$/) do
    click_button("bSubmit")
end