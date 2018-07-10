require 'pg'

def setup_test_database!
  p "cleaning database"

  connection = PG.connect(dbname: 'bookmark_manager_test2')

  # clear the Bookmark table
  connection.exec("TRUNCATE comments, bookmarks, tags, bookmark_tags;")

  # p "inserting bookmark in test database"
  # # insert a test bookmark in the Bookmark table
  # connection.exec("INSERT INTO Bookmark VALUES(1, 'http://test.com');")
end
