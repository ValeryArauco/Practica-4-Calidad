When(/^hago click en el enlace "(.*)"$/) do |link_text|
    @clicked_link = find_link(link_text)[:href]
end
  
Then(/^el enlace me redirige a un correo "(mailto:.*)"$/) do |expected_mailto|
    expect(@clicked_link).to start_with('mailto:') 
    expect(@clicked_link).to eq(expected_mailto)  
end
  