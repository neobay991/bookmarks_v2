require './bookmark_app.rb'

# As a user
# So that I can easily find a website I have bookmarked
# I would like to be able to see a list of my bookmarks

feature 'Bookmarks' do
  scenario 'return list of my bookmarks' do

    # Add the test data
    Bookmarks.create(url: 'http://3makersacademy.com')
    Bookmarks.create(url: 'http://destroyallsoftware.com')
    Bookmarks.create(url: 'http://google.com')

    visit('/bookmarks')
    expect(page).to have_content ("http://3makersacademy.com")
    expect(page).to have_content ("http://destroyallsoftware.com")
    expect(page).to have_content ("http://google.com")
  end

end
