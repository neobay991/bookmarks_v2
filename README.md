# Bookmark

User Stories & Domain Model
----
````
As a user
So that I can easily find a website I have bookmarked
I would like to be able to see a list of my Bookmark

╔════════════╗         .all         ╔════════════╗
║            ║--------------------->║            ║
║ Controller ║ [array of Bookmark] ║  Bookmark  ║
║            ║<---------------------║            ║
╚════════════╝                      ╚════════════╝

- When the user visits the index page, their browser sends a message to a controller we built.
- When the controller gets the request, it asks the Bookmark class to give it all the Bookmark, i.e. the controller asks for Bookmark.all.
- The Bookmark class goes and gets the Bookmark from the database somehow, and gives back all the Bookmark in an array to the controller.
- The controller renders the array of Bookmark to a webpage, which it sends as a response to the user (this interaction is not pictured)
--------

As a user
So that I can remember a website I like
I would like to be able to add a new bookmark


╔════════════╗      .add(bookmark)         ╔════════════╗
║            ║---------------------------->║            ║
║ Controller ║     [array of Bookmark]    ║  Bookmark  ║
║            ║<----------------------------║            ║
╚════════════╝                             ╚════════════╝

- When the user visits the index page, and click the "add link" button and type the website address to bookmark. Their browser sends a message to a controller we built.
- When the controller posts the request, it asks the Bookmark class to add the bookmark to the bookmark list, i.e. the controller asks for Bookmark.add(bookmark).
- The Bookmark class goes and posts the new bookmark from the database somehow, and gives back all the Bookmark in an array to the controller.
- The controller renders the array of Bookmark to a webpage, which it sends as a response to the user (this interaction is not pictured)
-------

As a user
So I can keep my Bookmark list up-to-date
I would like to be able to delete Bookmark

-------

As a user
So I can keep my Bookmark list up-to-date
I would like to be able to update Bookmark
````
