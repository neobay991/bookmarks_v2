require './bookmark_app.rb'

# As a user
# So that I can easily find a a bookmark
# I would like to be able to see tags associated with a Bookmark

feature 'tagging bookmarks' do
  scenario 'user can tag a link' do
    bookmark = Bookmark.create(url: 'http://3makersacademy.com', title: '3makersacademy')
    visit('/bookmarks')
    click_button('Add tag')
    fill_in(:tag_content, with: 'Test Tag')
    click_button('Submit')

    expect(page).to have_content ('Test Tag')

  end
end
