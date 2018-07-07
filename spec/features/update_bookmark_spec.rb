require './bookmark_app.rb'

# As a user
# So I can change a bookmark in Bookmark Manager
# # I want to update a bookmark
#
# feature 'Updating a bookmark' do
#   scenario 'A user can update a bookmark' do
#     Bookmarks.create(url: 'http://bookmark1.com', titlde: 'Bookmark 1')
#     visit('/bookmarks')
#     Bookmarks.create(url: 'http://bookmark2.com', title: 'Bookmark 2')
#
#     click_button('Delete')
#
#
#     expect(page).not_to have_content 'Bookmark 2'
#     expect(page).to have_content 'Bookmark 1'
#   end
# end
