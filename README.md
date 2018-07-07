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
║ Controller ║     [array of Bookmark]     ║  Bookmark  ║
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
So I can change a bookmark in Bookmark Manager
I want to update a bookmark

-------

As a user
So I can keep remeber which bookmarks I like
I would like to be able to add comments to a Bookmark

In a one-to-many relationship, there are two models:

one 'parent' model, Bookmark, has many Comments.
the 'child' model, Comment, belongs to a single Bookmark.
  ONE       ––≡≡   MANY
 Bookmark   ––≡≡  Comments

 The only way to store this in a table relationship is to add an extra column to the 'child' model.

For instance, in the table below, the first two comments refer to a Bookmark with an ID of 1. The last comment refers to a Bookmark with an ID of 2:

Comments table:

| id | text                       | bookmark_id |
|----|----------------------------|-------------|
| 1  | Great Bookmark!            | 1           |
| 2  | I don't like this Bookmark | 1           |
| 3  | What a cool resource       | 2           |

Comments with ID 1 and 2 are comments on the same Bookmark. If they were displayed, they'd look like this:

Bookmark 1
Great Bookmark!
I don't like this Bookmark.
Bookmark 2
What a cool resource
````
