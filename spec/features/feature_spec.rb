require_relative '../../models/link'

describe BookmarkManager do
  feature 'Viewing Links' do
    scenario '#has a list of links' do
      fill_in_link
      visit '/links'
      expect(page.status_code).to eq 200
      within 'ul#linklist' do
        expect(page).to have_content('Makers')
        expect(page).to have_content('www.makers.com')
        expect(page).to have_content('coding')
      end
    end
  end

  feature 'creating links' do
    before do
      visit '/links/new'
    end

    describe 'has a form' do
      it 'for title' do
        expect(page).to have_field('title')
      end
      it 'for url' do
        expect(page).to have_field('url')
      end
      it 'for tags' do
        expect(page).to have_selector('input[type=submit][value="Submit"]')
      end
    end

    it 'can add tags' do
      fill_in_link
      link = Link.first
      expect(link.tags.map(&:name)).to include('coding')
    end
  end

  feature 'filtering by tag' do
    before do
      fill_in_bbc
      fill_in_bubbles
      fill_in_bubbles2
    end
    it 'populates page with only the right tag' do
      visit '/tags/bubbles'

      save_and_open_page
      expect(page).to have_content 'Bubbl1111es'
      expect(page).to have_content 'Bubble2222s'
      expect(page).to_not have_content 'BBC'
    end
  end
end
