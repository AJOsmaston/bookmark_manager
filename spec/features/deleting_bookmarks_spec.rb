feature 'deleting bookmarks' do
  scenario 'delete first bookmark' do
    Bookmark.create(url: 'http://www.google.com', title: 'Google')
    visit ('/bookmarks')
    expect(page).to have_link('Google', href: 'http://www.google.com')

    first('.bookmark').click_button 'Delete'

    expect(current_path).to eq ('/bookmarks')
    expect(page).not_to have_link('Google', href: 'http://www.google.com')
  end
end
