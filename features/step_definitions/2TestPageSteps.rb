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
    list_Internet_explorer = table.raw.flatten
  
    blinking_text = find(:xpath, '/html/body/div/center/table/tbody/tr/td[2]/table/tbody/tr[2]/td[1]/p').text
  
    bullets = all(:xpath, '/html/body/div/center/table/tbody/tr/td[2]/table/tbody/tr[2]/td[1]/ul/li').map(&:text)
  
    actual_Internet_explorer = [blinking_text] + bullets
  
    expect(actual_Internet_explorer).to match_array(list_Internet_explorer)
end
  
Then(/^observo la informacion correspondiente a Netscape Navigator:$/) do |table|
    list_Netscape_Navigator = table.raw.flatten

    actual_Netscape_Navigator = all(:xpath, '/html/body/div/center/table/tbody/tr/td[2]/table/tbody/tr[2]/td[2]/p').map(&:text)
  
    expect(actual_Netscape_Navigator).to match_array(list_Netscape_Navigator)
end

Then(/^observo que el contenido de la página es "([^"]*)"$/) do |expected_text|
    actual_text = find(:xpath, '/html/body/p[2]').text
  
    expect(actual_text).to eq(expected_text)
end 

Then(/^observo el contenido esperado de la tabla ActiveX:$/) do |expected_table|
    expected_content_table = expected_table.raw.flatten
  
    actual_table = all(:xpath, '/html/body/div/center/table//td//object').map do |element|
        element.text.strip.split(":").last.strip
    end
      
    expect(actual_table).to match_array(expected_content_table)
  end
  