require 'bookmark'

describe Bookmark do
  describe '#all' do 
    it 'returns all bookmarks' do
      Bookmark.create("http://www.google.com")
      Bookmark.create("http://www.amazon.com")
      Bookmark.create("http://www.twitter.com")
      
      bookmarks = Bookmark.all

      expect(bookmarks).to include("http://www.google.com")
      expect(bookmarks).to include("http://www.amazon.com")
      expect(bookmarks).to include("http://www.twitter.com")
    end
  end

  describe '#create' do
    it 'creates a bookmark' do
      Bookmark.create("http://www.google.com")
      bookmarks = Bookmark.all
      
      expect(bookmarks).to include("http://www.google.com")
    end
  end
end
