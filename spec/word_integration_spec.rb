
require('capybara/rspec')
require('./app')
require('./lib/word.rb')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('word definer') do
  before()do
    Word.clear
  end

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
      click_button('Add Word')
      click_link('Intelligent')
      expect(page).to have_content('Intelligent')
    end
  end

  describe('deleting a word in the list', {:type => :feature}) do
    it('removes the word') do
      visit('/')
      fill_in('word_name', :with => 'Intelligent')
      fill_in('definition', :with => 'Someone who is smart.')
      click_button('Add Word')
      click_link('Intelligent')
      click_link('Delete')
      expect(page).to have_content('Add words')
    end
  end

  describe('add definition form', {:type => :feature}) do
    it('adds a definition to the word') do
      visit('/')
      fill_in('word_name', :with => 'Intelligent')
      fill_in('definition', :with => 'Someone who is smart.')
      click_button('Add Word')
      click_link('Intelligent')
      fill_in('definition', :with => 'Someone who talks a lot.')
      click_button('Add Definition')
      expect(page).to have_content('talks a lot.')
    end
  end

  describe('error', {:type => :feature}) do
    it('shows an error if the word exists') do
      visit('/')
      fill_in('word_name', :with => 'Intelligent')
      fill_in('definition', :with => 'Someone who is smart.')
      click_button('Add Word')
      fill_in('word_name', :with => 'Intelligent')
      fill_in('definition', :with => 'Someone who is smart.')
      click_button('Add Word')
      expect(page).to have_content('Oops')
    end
  end
end
