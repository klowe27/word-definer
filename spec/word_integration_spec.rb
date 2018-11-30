
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the add word form', {:type => :feature}) do
  it('takes a word and definition input and displays the word in a list') do
    visit('/')
    fill_in('word_name', :with => 'Intelligent')
    fill_in('definition', :with => 'Someone who is smart.')
    click_button('Add Word')
    expect(page).to have_content('Intelligent')
  end
end

describe('clicking on a word in the list', {:type => :feature}) do
  it('takes the user to that word\'s page with definitions') do
    visit('/')
    fill_in('word_name', :with => 'Intelligent')
    fill_in('definition', :with => 'Someone who is smart.')
    click_link('Intelligent')
    expect(page).to have_content('Intelligent')
  end
end

describe('deleting a word in the list', {:type => :feature}) do
  it('removes the word') do
    visit('/')
    fill_in('word_name', :with => 'Intelligent')
    fill_in('definition', :with => 'Someone who is smart.')
    click_link('Intelligent')
    click_link('Delete')
    expect(page).to have_content('Add words')
  end
end

describe('add definition form', {:type => :feature}) do
  it('adds a definition to the word') do
    visit('/')
    fill_in('definition', :with => 'Someone who talks a lot.')
    click_button('Add Definition')
    expect(page).to have_content('talks a lot.')
  end
end
