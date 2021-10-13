feature 'adding a bookmark' do
  scenario 'user adds a bookmark' do
    visit ('/bookmarks')
    click_link 'Add bookmark'
    fill_in 'address', with: 'https://devhints.io/capybara'
    click_button 'Submit'

    expect(page).to have_content 'https://devhints.io/capybara'
  end
end
