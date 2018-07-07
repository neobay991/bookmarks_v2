require 'Bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all Bookmark in an array' do

      # Add the test data
      bookmark_1 = Bookmark.create(url: 'http://makersacademy.com', title: 'makersacademy')
      bookmark_2 = Bookmark.create(url: 'http://destroyallsoftware.com', title: 'destroyallsoftware')
      bookmark_3 = Bookmark.create(url: 'http://google.com', title: 'google')

      expected_Bookmark = [
        bookmark_1,
        bookmark_2,
        bookmark_3
      ]

      expect(Bookmark.all).to eq expected_Bookmark
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      bookmark_1 = Bookmark.create(url: 'http://www.AddBookmark.com', title: 'AddBookmark')

      expect(Bookmark.all).to include bookmark_1
    end

    it 'does not create a bookmark if the URL is not valid' do
      Bookmark.create(url: 'Not a valid bookmark')

      expect(Bookmark.all).to_not include 'Not a valid bookmark'
    end
  end

  # TODO review this test, need to stub the id
  # describe '.find' do
  #   it 'finds a bookmark' do
  #     Bookmark.create(url: 'http://3makersacademy.com', title: '3makersacademy')
  #     @bookmark = Bookmark.find(1)
  #     p @bookmark.inspect
  #     expect(@bookmark.url).to eq "http://3makersacademy.com"
  #     expect(@bookmark.title).to eq "3makersacademy"
  #   end
  # end

  describe '#==' do
    it 'two Bookmark are equal if their IDs match' do
      bookmark_1 = Bookmark.new(1, 'http://BookmarkID.com', 'title')
      bookmark_2 = Bookmark.new(1, 'http://BookmarkID.com', 'title')

      expect(bookmark_1).to eq bookmark_2
    end
  end
end
