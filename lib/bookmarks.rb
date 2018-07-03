require 'pg'

class Bookmarks
  def self.all
      if ENV['RACK_ENV'] == 'test'
        connection = PG.connect(dbname: 'Bookmark_manager_test')
      else
        connection = PG.connect(dbname: 'Bookmark_manager')
      end
      result = connection.exec("SELECT * FROM bookmarks")
      result.map { |bookmark| bookmark['url'] }
    # [
    #   "http://makersacademy.com",
    #   "http://destroyallsoftware.com",
    #   "http://google.com"
    # ]
  end
end
