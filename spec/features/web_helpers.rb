def fill_in_link
  visit '/links/new'
  fill_in('title', with: 'Makers')
  fill_in('url', with: 'www.makers.com')
  fill_in('tags', with: 'coding')
  click_button 'Submit'
end

def fill_in_bbc
  visit '/links/new'
  fill_in('title', with: 'BBCtest3')
  fill_in('url', with: 'http://bbc.co.uk')
  fill_in('tags', with: 'BBC')
  click_button 'Submit'
end
