require 'bookmarks'

describe Bookmarks do
  describe '.all' do
    it 'returns all bookmarks in an array' do

      # Add the test data
      Bookmarks.create(url: 'http://makersacademy.com')
      Bookmarks.create(url: 'http://destroyallsoftware.com')
      Bookmarks.create(url: 'http://google.com')

      expected_bookmarks = [
        'http://makersacademy.com',
        'http://destroyallsoftware.com',
        'http://google.com'
      ]

      expect(Bookmarks.all).to eq expected_bookmarks
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      Bookmarks.create(url: 'http://www.AddBookmark.com')

      expect(Bookmarks.all).to include 'http://www.AddBookmark.com'
    end

    it 'does not create a bookmark if the URL is not valid' do
      Bookmarks.create(url: 'Not a valid bookmark')

      expect(Bookmarks.all).to_not include 'Not a valid bookmark'
    end
  end
end
