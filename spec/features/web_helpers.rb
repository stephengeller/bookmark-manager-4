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

def fill_in_bubbles
  visit '/links/new'
  fill_in('title', with: 'Bubbl1111es')
  fill_in('url', with: 'http://bbuubblesss.co.uk')
  fill_in('tags', with: 'bubbles')
  click_button 'Submit'
end

def fill_in_bubbles2
  visit '/links/new'
  fill_in('title', with: 'Bubble2222s')
  fill_in('url', with: 'http://bbuu222bblesss.co.uk')
  fill_in('tags', with: 'bubbles')
  click_button 'Submit'
end