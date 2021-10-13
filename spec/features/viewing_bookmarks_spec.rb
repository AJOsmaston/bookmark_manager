feature 'Viewing bookmarks' do
  scenario 'visiting index' do
    visit('/')

    expect(page).to have_content "Bookmark Manager"
  end

  scenario 'user can see the bookmarks' do
    Bookmark.create(url: "http://www.google.com", title: "Google")
    Bookmark.create(url: "http://www.amazon.com", title: "Amazon")
    Bookmark.create(url: "http://www.twitter.com", title: "Twitter")

    visit('/bookmarks')

    expect(page).to have_link('Google', href: "http://www.google.com")
    expect(page).to have_link('Amazon', href: "http://www.amazon.com")
    expect(page).to have_link('Twitter', href: "http://www.twitter.com")

  end
end
