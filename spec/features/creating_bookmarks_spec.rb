require './bookmark_app.rb'

# As a user
# So I can store bookmark data for later retrieval
# I want to add a bookmark to Bookmark Manager

feature 'Adding a new bookmark' do
  scenario 'add a bookmark' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://ADDBOOKMARK.com')
    click_button('Submit')

    expect(page).to have_content 'http://ADDBOOKMARK.com'
  end
end
