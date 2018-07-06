require 'pg'

class Bookmarks
  def self.all
      if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'bookmark_manager_test2')
      else
        connection = PG.connect(dbname: 'bookmark_manager')
      end

      result = connection.exec("SELECT * FROM bookmarks")

      # The result object contains the bookmarks, each of which is a hash of the bookmark ID and bookmark URL. We map each hash to the url key of the hash. This gives us an array of the bookmark URLs. e.g
      # => ["http://www.google.com", "http://www.bbc.co.uk", "http://www.yahoo.com"]
      result.map { |bookmark| bookmark['url']  }
  end
end
