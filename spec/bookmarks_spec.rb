require 'bookmarks'

describe Bookmarks do
  describe '.all' do
    it 'returns all bookmarks in an array' do

      # Add the test data
      bookmark_1 = Bookmarks.create(url: 'http://makersacademy.com', title: 'makersacademy')
      bookmark_2 = Bookmarks.create(url: 'http://destroyallsoftware.com', title: 'destroyallsoftware')
      bookmark_3 = Bookmarks.create(url: 'http://google.com', title: 'google')

      expected_bookmarks = [
        bookmark_1,
        bookmark_2,
        bookmark_3
      ]

      expect(Bookmarks.all).to eq expected_bookmarks
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      bookmark_1 = Bookmarks.create(url: 'http://www.AddBookmark.com', title: 'AddBookmark')

      expect(Bookmarks.all).to include bookmark_1
    end

    it 'does not create a bookmark if the URL is not valid' do
      Bookmarks.create(url: 'Not a valid bookmark')

      expect(Bookmarks.all).to_not include 'Not a valid bookmark'
    end
  end

  # TODO review this test, need to stub the id
  # describe '.find' do
  #   it 'finds a bookmark' do
  #     Bookmarks.create(url: 'http://3makersacademy.com', title: '3makersacademy')
  #     @bookmark = Bookmarks.find(1)
  #     p @bookmark.inspect
  #     expect(@bookmark.url).to eq "http://3makersacademy.com"
  #     expect(@bookmark.title).to eq "3makersacademy"
  #   end
  # end

  describe '#==' do
    it 'two Bookmarks are equal if their IDs match' do
      bookmark_1 = Bookmarks.new(1, 'http://BookmarkID.com', 'title')
      bookmark_2 = Bookmarks.new(1, 'http://BookmarkID.com', 'title')

      expect(bookmark_1).to eq bookmark_2
    end
  end
end
