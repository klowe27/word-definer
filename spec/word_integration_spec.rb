
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
      click_button('Add Word')
      expect(page).to have_content('Intelligent')
    end
  end

  describe('clicking on a word in the list', {:type => :feature}) do
    it('takes the user to that word\'s page with definitions') do
      visit('/')
      fill_in('word_name', :with => 'Intelligent')
      click_button('Add Word')
      click_link('Intelligent')
      expect(page).to have_content('Intelligent')
    end
  end

  describe('delete button on word page', {:type => :feature}) do
    it('removes the word from the list') do
      visit('/')
      fill_in('word_name', :with => 'Intelligent')
      click_button('Add Word')
      click_link('Intelligent')
      click_button('Delete Word')
      expect(page).to have_content('Enter a word')
    end
  end

  describe('add definition form', {:type => :feature}) do
    it('adds a definition to the word') do
      visit('/')
      fill_in('word_name', :with => 'Intelligent')
      click_button('Add Word')
      click_link('Intelligent')
      fill_in('definition', :with => 'Someone who talks a lot.')
      click_button('Add')
      expect(page).to have_content('talks a lot.')
    end
  end

  describe('error', {:type => :feature}) do
    it('shows an error if the word already exists') do
      visit('/')
      fill_in('word_name', :with => 'Intelligent')
      click_button('Add Word')
      fill_in('word_name', :with => 'Intelligent')
      click_button('Add Word')
      expect(page).to have_content('Oops')
    end
  end
  
  describe('view all link', {:type => :feature}) do
    it('shows all words with their definitions') do
      visit('/')
      fill_in('word_name', :with => 'Intelligent')
      click_button('Add Word')
      click_link('View All Words')
      expect(page).to have_content('Intelligent')
    end
  end
end
