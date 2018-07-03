require 'bookmarks'

describe Bookmarks do
  describe '.all' do
    it 'show all bookmarks' do
      bookmarks = Bookmarks.all
      expect(bookmarks).to include('http://www.test.com')
    end
  end
end
