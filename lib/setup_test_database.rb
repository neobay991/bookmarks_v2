require 'pg'

  p "setting up test database"
  
  connection = PG.connect(dbname: 'Bookmark_manager_test')

  # clear the bookmarks table
  connection.exec("TRUNCATE bookmarks;")

  p "inserting bookmark in test database"
  # insert a test bookmark in the bookmarks table
  connection.exec("INSERT INTO bookmarks VALUES(1, 'http://test.com');")
