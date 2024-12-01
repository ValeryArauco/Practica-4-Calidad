Given(/^hago click en "Browser Test Page"$/) do
    click_button("bBrowserTest")
end

When(/^ingreso al enlace de "([^"]*)"$/) do |link_name|
    case link_name
    when "Java Applet"
      find(:xpath, '//a[@href="javaapplet.htm"]').click
    when "ActiveX"
      find(:xpath, '//a[@href="activex.htm"]').click
    end
  end

Then(/^observo la informacion correspondiente a Internet Explorer:$/) do |table|
    # Información esperada de Internet Explorer
    list_Internet_explorer = table.raw.flatten
  
    # Informacion de Blinking Text
    blinking_text = find(:xpath, '/html/body/div/center/table/tbody/tr/td[2]/table/tbody/tr[2]/td[1]/p').text
  
    # Informacion de bullets 
    bullets = all(:xpath, '/html/body/div/center/table/tbody/tr/td[2]/table/tbody/tr[2]/td[1]/ul/li').map(&:text)
  
    # Combinamos ambos para obtener la informacion actual de Netscape Navigator
    actual_Internet_explorer = [blinking_text] + bullets
  
    # Verificar que la información actual coincida con la esperada
    expect(actual_Internet_explorer).to match_array(list_Internet_explorer)
end
  
Then(/^observo la informacion correspondiente a Netscape Navigator:$/) do |table|
    # Informacion esperada de Netscape Navigator
    list_Netscape_Navigator = table.raw.flatten

    # Informacion actual de Netscape Navigator
    actual_Netscape_Navigator = all(:xpath, '/html/body/div/center/table/tbody/tr/td[2]/table/tbody/tr[2]/td[2]/p').map(&:text)
  
    # Verificamos si la informacion coincide
    expect(actual_Netscape_Navigator).to match_array(list_Netscape_Navigator)
end

Then(/^observo que el contenido de la página es "([^"]*)"$/) do |expected_text|
    # Texto actual del XPath especificado
    actual_text = find(:xpath, '/html/body/p[2]').text
  
    # Verificamos si la informacion coincide
    expect(actual_text).to eq(expected_text)
end 

Then(/^observo el contenido esperado de la tabla ActiveX:$/) do |expected_table|
    # Obtener el contenido esperado de la tabla
    expected_content_table = expected_table.raw.flatten
  
    # Se bsucan las celdas con texto incluido en la tabla ActiveX
    actual_table = all(:xpath, '/html/body/div/center/table//td//object').map do |element|
        element.text.strip.split(":").last.strip
    end
  
    # Verificar que el contenido de la tabla actual coincida con el esperado
    expect(actual_table).to match_array(expected_content_table)
  end
  