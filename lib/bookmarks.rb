require 'pg'

class Bookmarks
  def self.all
      if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'bookmark_manager_test2')
      else
        connection = PG.connect(dbname: 'bookmark_manager')
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
