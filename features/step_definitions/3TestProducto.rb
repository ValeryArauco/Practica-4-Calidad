Given(/^hago click en el boton "([^"]*)"$/) do |boton|
  #if (boton == "Enter GMO Online" || boton == "Proceed With Order")
  click_button("bSubmit")
  #end
end

When(/^hago click en un producto "([^"]*)"$/) do |producto|
    xpath_base = "/html/body/form/table/tbody/tr[2]/td/div/center/table/tbody/tr[5]/td[2]/a/strong"
    find(:xpath, xpath_base).click
end

Then(/^observo el detalle del producto "([^"]*)"$/) do |producto| 
    # Verificar el título
  expect(page).to have_selector('a[name="socks"]', text: producto)

  # Verificar la descripción
  descripcion = find("body > p:nth-child(34)")
  expect(page).to have_content(descripcion.text)

  # Verificar la tabla de detalles
  within("body > div:nth-child(35)") do
    within('table') do
        # Verificar el precio unitario
        expect(page).to have_selector('td', text: 'Unit Price:')
        expect(page).to have_selector('td', text: '$ 19.99')
    
        # Verificar la cantidad en stock
        expect(page).to have_selector('td', text: '# In Stock:')
        expect(page).to have_selector('td', text: '47')
    
        # Verificar el número del artículo
        expect(page).to have_selector('td', text: 'Item Number:')
        expect(page).to have_selector('td', text: '1003')
        end
    end
  

  # Verificar el texto de descripción adicional
  expect(page).to have_content('These heavyweight socks are designed for long distances.')
end