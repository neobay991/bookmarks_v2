require './bookmark_app.rb'

# As a user
# So I can remove my bookmark from Bookmark Manager
# I want to delete a bookmark

feature 'Deleting a bookmark' do
  scenario 'A user can delete a bookmark' do
    visit('/bookmarks/new')
    fill_in('url', with: "http://bookmark1.com")
    fill_in('title', with: "Bookmark 1")
    click_button('Add bookmark')
    visit('/bookmarks/new')
    fill_in('url', with: "http://bookmark2.com")
    fill_in('title', with: "Bookmark 2")
    click_button('Add bookmark')
    click_button('Delete', match: :first)

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_content 'Bookmark 1'
    expect(page).to have_content 'Bookmark 2'
  end
end
