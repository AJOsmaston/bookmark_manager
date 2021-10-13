require 'bookmark'

describe Bookmark do
  describe '#all' do 
    it 'returns all bookmarks' do
      Bookmark.add("http://www.google.com")
      Bookmark.add("http://www.amazon.com")
      Bookmark.add("http://www.twitter.com")
      
      bookmarks = Bookmark.all

      expect(bookmarks).to include("http://www.google.com")
      expect(bookmarks).to include("http://www.amazon.com")
      expect(bookmarks).to include("http://www.twitter.com")
    end
  end

  describe '#add' do
    it 'adds a bookmark' do
      Bookmark.add("http://www.google.com")
      bookmarks = Bookmark.all
      
      expect(bookmarks).to include("http://www.google.com")
    end
  end
end
