require './bookmark_app.rb'

# As a user
# So I can change a bookmark in Bookmark Manager
# I want to update a bookmark

feature 'Updating a bookmark' do
  scenario 'A user can update a bookmark' do
    visit('/bookmarks/new')
    fill_in('url', with: "http://AddBookmark.com")
    fill_in('title', with: "AddBookmark")
    click_button('Add bookmark')
    visit('/bookmarks')
    click_button('Edit')
    fill_in('url', with: "http://Editbookmark.com")
    fill_in('title', with: "EditBookmark UPDATED")
    click_button('Update')

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_content 'AddBookmark'
    expect(page).to have_content 'EditBookmark UPDATED'
  end
end
