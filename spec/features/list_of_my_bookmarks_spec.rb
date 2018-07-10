require './bookmark_app.rb'

# As a user
# So that I can easily find a website I have bookmarked
# I would like to be able to see a list of my Bookmark

feature 'List of bookamrks' do
  scenario 'a user can view a list of  Bookmark' do
    # Add the test data
    Bookmark.create(url: 'http://3makersacademy.com', title: '3makersacademy')
    Bookmark.create(url: 'http://destroyallsoftware.com', title: 'destroyallsoftware')
    Bookmark.create(url: 'http://google.com', title: 'google')

    visit('/bookmarks')

    expect(page).to have_content ("3makersacademy")
    expect(page).to have_content ("destroyallsoftware")
    expect(page).to have_content ("google")
  end

end
