require 'bookmark'

describe Bookmark do
  describe '.all' do 
    it 'returns all bookmarks' do
      bookmark = Bookmark.create(url: "http://www.google.com", title: "Google")
      Bookmark.create(url: "http://www.amazon.com", title: "Amazon")
      Bookmark.create(url: "http://www.twitter.com", title: "Twitter")
      
      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq "Google"
      expect(bookmarks.first.url).to eq "http://www.google.com"
    end
  end

  describe '.create' do
    it 'creates a bookmark' do
      bookmark = Bookmark.create(url: "http://www.google.com", title: "Google")
      persisted_data = PG.connect(dbname: 'bookmark_manager_test').query("SELECT * FROM bookmarks WHERE id = #{bookmark.id};")

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.title).to eq 'Google'
      expect(bookmark.url).to eq "http://www.google.com"
    end
  end
end
