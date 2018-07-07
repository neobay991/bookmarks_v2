

# As a user
# So I can store bookmark data for later retrieval
# I want to add a bookmark to Bookmark Manager

feature 'Adding a new bookmark' do
  scenario 'a user can add a bookmark' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://AddBookmark.com')
    fill_in('title', with: 'AddBookmark')
    click_button('Add bookmark')

    expect(current_path).to eq '/bookmarks'
    expect(page).to have_content 'AddBookmark'
  end

  scenario 'the bookmark must be a valid url' do
    visit('/bookmarks/new')
    fill_in('url', with: 'Not a valid bookmark')
    click_button('Add bookmark')

    expect(page).to_not have_content 'Not a valid bookmark'
    expect(page).to have_content 'You must submit a valid URL'
  end
end
