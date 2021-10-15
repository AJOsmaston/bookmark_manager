feature 'adding a bookmark' do
  scenario 'user adds a bookmark' do
    visit ('/bookmarks')
    click_link 'Add bookmark'
    fill_in 'address', with: 'https://devhints.io/capybara'
    fill_in 'title', with: 'Capybara Cheat Sheet'
    click_button 'Submit'

    expect(page).to have_link('Capybara Cheat Sheet', href: 'https://devhints.io/capybara')
  end

  scenario 'user adds an invalid link' do
    visit ('/bookmarks/new')
    fill_in 'address', with: 'this is not a link'
    fill_in 'title', with: 'Fake Link'
    click_button 'Submit'

    expect(page).to have_content "Invalid URL"
    expect(page).not_to have_content "this is not a link"
  end
end
