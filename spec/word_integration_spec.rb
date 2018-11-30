
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe('the Word Definer', {:type => :feature}) do
  it('takes a word and definition input and displays the word in a list') do
    visit('/')
    fill_in('word', :with => 'Intelligent')
    fill_in('definition', :with => 'Someone who is smart.')
    click_button('Add word')
    expect(page).to have_content('Intelligent')
  end
end
