Given(/^hago click en el boton "([^"]*)"$/) do |boton|
  click_button("bSubmit")
end

When(/^hago click en el producto "([^"]*)"$/) do |item|
  within("body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody") do
    find("a", text: item).click
  end
end

Then(/^observo el "([^"]*)" del producto$/) do |detalle| 
  expect(page).to have_content(detalle)
end
