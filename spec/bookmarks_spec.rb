require 'bookmarks'

describe Bookmarks do
  describe '.all' do
    it 'returns all bookmarks in an array' do
      connection = PG.connect(dbname: 'bookmark_manager_test2')

      # Add the test data
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://google.com');")

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
      connection = PG.connect(dbname: 'bookmark_manager_test2')
      Bookmarks.create(url: 'http://www.tessstbookmark.com')

      expect(Bookmarks.all).to include 'http://www.tessstbookmark.com'
    end
  end
end
