require './bookmark_app.rb'

feature 'Commenting on a bookmark' do
  scenario 'comment on a bookmark' do
    visit('/bookmarks/new')
    fill_in('url', with: "http://bookmark1.com")
    fill_in('title', with: "Bookmark 1")
    click_button('Add bookmark')
    visit('/bookmarks')
    click_button('Add comment')
    fill_in(:text, with: 'This is a test comment for a bookmark')
    click_button('Submit')

    expect(current_path).to eq '/bookmarks'
    expect(page).to have_content 'This is a test comment for a bookmark'
  end
end
