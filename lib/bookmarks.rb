require 'pg'

class Bookmarks
  def self.all
      connection = PG.connect(dbname: 'Bookmark_manager')
      result = connection.exec("SELECT * FROM bookmarks")
      result.map { |bookmark| bookmark['url'] }
    # [
    #   "http://makersacademy.com",
    #   "http://destroyallsoftware.com",
    #   "http://google.com"
    # ]
  end
end
