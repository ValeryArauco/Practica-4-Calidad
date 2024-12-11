Then(/^veo la lista de items$/) do |table|
  items = table.raw.flatten
  within('body > form > table > tbody > tr:nth-child(2) > td > div > center > table') do
    rows = all('tr')
    rows.each_with_index do |row, index|
      next if index == 0 
      item_name = row.all('td')[1].text.strip
      expect(items).to include(item_name)
    end
  end
end
