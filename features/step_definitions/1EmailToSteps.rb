When(/^hago click en el enlace "(.*)"$/) do |link_text|
    @clicked_link = find_link(link_text)[:href]
end
  
def validate_email(email)
    email_regex = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    email.match?(email_regex)
end

Then(/^la dirección de correo proporcionada debe ser válida$/) do
    correo = @clicked_link.gsub('mailto:', '')
    expect(validate_email(correo)).to be_truthy, 
        "El formato de correo no es válido"
end

Then(/^el enlace me redirige a un correo "(mailto:.*)"$/) do |expected_mailto|
    expect(@clicked_link).to start_with('mailto:') 
    expect(@clicked_link).to eq(expected_mailto)  
end

