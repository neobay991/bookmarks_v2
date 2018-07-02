require './bookmark_app.rb'

feature 'Testing' do
  scenario 'Can run a app' do
    visit('/server')
    expect(page).to have_content('Testing')
  end
end
