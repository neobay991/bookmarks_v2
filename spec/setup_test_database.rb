require 'pg'

def setup_test_database!
  p "cleaning database"

  connection = PG.connect(dbname: 'bookmark_manager_test2')

  # clear the bookmarks table
  connection.exec("TRUNCATE bookmarks;")

  # p "inserting bookmark in test database"
  # # insert a test bookmark in the bookmarks table
  # connection.exec("INSERT INTO bookmarks VALUES(1, 'http://test.com');")
end
