require './bookmark_app.rb'

# As a user
# So I can remove my bookmark from Bookmark Manager
# I want to delete a bookmark

# feature 'Deleting a bookmark' do
#   scenario 'A user can delete a bookmark' do
#     Bookmarks.create(url: 'http://bookmark1.com', title: 'Bookmark 1')
#     visit('/bookmarks')
#     Bookmarks.create(url: 'http://bookmark2.com', title: 'Bookmark 2')
#
#     click_button('Delete', match: :first)
#
#     expect(current_path).to eq '/bookmarks'
#     expect(page).not_to have_content 'Bookmark 2'
#   end
# end
