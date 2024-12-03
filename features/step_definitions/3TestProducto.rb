Given(/^hago click en el boton "([^"]*)"$/) do |boton|
  click_button("bSubmit")
end

When(/^hago click en el producto "([^"]*)"$/) do |item|
  within("body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody") do
    find("a", text: item).click
  end
end

Then(/^observo el detalle del "([^"]*)"$/) do |item| 
  expect(page).to have_content(item)
end