require './bookmark_app.rb'

# As a user
# So that I can easily find a website I have bookmarked
# I would like to be able to see a list of my bookmarks

feature 'Bookmarks' do
  scenario 'return list of my bookmarks' do
    visit('/')
    expect(page).to have_content 'Makers Academy'
  end

end
