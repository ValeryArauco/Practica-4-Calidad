Given(/^Estoy en el sitio de GMO online$/) do
    page.driver.browser.manage.window.maximize
    visit('https://demo.borland.com/gmopost/')
end

Given(/^hago click en "About the GMO Site"$/) do
    click_button("bAbout")
end

Then(/^observo la lista de las tecnologias usadas en el sitio:$/) do |table|
    list_technologies = table.raw.flatten

    expect(page).to have_selector('body > div > center > table > tbody > tr:nth-child(2) > td:nth-child(1) > blockquote > ul')
  
    actual_technologies = all('body > div > center > table > tbody > tr:nth-child(2) > td:nth-child(1) > blockquote > ul > li').map(&:text)
  
    expect(actual_technologies).to match_array(list_technologies)
end

Then(/^observo la lista de las tecnologias a incorporar en el sitio a futuro:$/) do |table_future|
    list_technologies = table_future.raw.flatten

    expect(page).to have_selector('body > div > center > table > tbody > tr:nth-child(2) > td:nth-child(2) > blockquote > ul')
  
    future_technologies = all('body > div > center > table > tbody > tr:nth-child(2) > td:nth-child(2) > blockquote > ul > li').map(&:text)
  
    expect(future_technologies).to match_array(list_technologies)
end