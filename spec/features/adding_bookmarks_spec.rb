feature 'adding a bookmark' do
  scenario 'user adds a bookmark' do
    visit ('/bookmarks')
    click_link 'Add bookmark'
    fill_in 'address', with: 'https://devhints.io/capybara'
    fill_in 'title', with: 'Capybara Cheat Sheet'
    click_button 'Submit'

    expect(page).to have_link('Capybara Cheat Sheet', href: 'https://devhints.io/capybara')
  end
end
