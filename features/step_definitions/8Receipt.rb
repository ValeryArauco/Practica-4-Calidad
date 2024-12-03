Then(/^debería mostrarse que los datos coincidan con los ingresados"$/) do |table|
    expect(page).to have_selector('body > table:nth-child(5) > tbody > tr:nth-child(1) > td > div > center > table > tbody > tr:nth-child(1) > td:nth-child(2) > strong', text: nombre)
end

And(/^debería mostrarse la dirección de facturación con direccion "(.*)" ciudad, estado y codigo zip "(.*)"$/) do |direccion, ciudad|
    expect(page).to have_selector('body > table:nth-child(5) > tbody > tr:nth-child(1) > td > div > center > table > tbody > tr:nth-child(1) > td:nth-child(2) > strong', text: nombre)
    expect(page).to have_selector('body > table:nth-child(5) > tbody > tr:nth-child(1) > td > div > center > table > tbody > tr:nth-child(1) > td:nth-child(2) > strong', text: nombre)
end