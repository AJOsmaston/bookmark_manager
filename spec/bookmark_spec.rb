require 'bookmark'
require_relative 'setup_test_database'

describe Bookmark do
  describe '.all' do 
    it 'returns all bookmarks' do
      bookmark = Bookmark.create(url: "http://www.google.com", title: "Google")
      Bookmark.create(url: "http://www.amazon.com", title: "Amazon")
      Bookmark.create(url: "http://www.twitter.com", title: "Twitter")
      persisted_data = persisted_data(id: bookmark.id)
      
      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(persisted_data['id']).to eq bookmark.id
      expect(persisted_data['title']).to eq "Google"
      expect(persisted_data['url']).to eq "http://www.google.com"
    end
  end

  describe '.create' do
    it 'creates a bookmark' do
      bookmark = Bookmark.create(url: "http://www.google.com", title: "Google")
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq 'Google'
      expect(bookmark.url).to eq "http://www.google.com"
    end
  end

  describe '.delete' do
    it 'deletes a bookmark' do
      bookmark = Bookmark.create(url: "http://www.google.com", title: "Google")
      Bookmark.delete(id: bookmark.id)

      expect(Bookmark.all.length).to eq 0
    end
  end
end
