feature 'updating bookmarks' do
  scenario 'update first bookmark' do
    Bookmark.create(url: "http://www.google.com", title: "Google")
    visit('/bookmarks')
    expect(page).to have_link('Google', href: 'http://www.google.com')

    first('.bookmark').click_button 'Edit'

    fill_in 'address', with: 'https://devhints.io/capybara'
    fill_in 'title', with: 'Capybara Cheat Sheet'
    click_button 'Submit'

    expect(page).to have_link('Capybara Cheat Sheet', href: 'https://devhints.io/capybara')
    expect(page).not_to have_link('Google', href: 'http://www.google.com')
  end
end
