require 'bookmarks'

describe Bookmarks do
  describe '.all' do
    it 'show all bookmarks' do
      bookmarks = Bookmarks.all
      expect(bookmarks).to include("http://makersacademy.com")
      expect(bookmarks).to include("http://destroyallsoftware.com")
      expect(bookmarks).to include("http://google.com")
    end
  end
end
