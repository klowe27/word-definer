require('pry')
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')

get('/') do
  @words = Word.all
  erb(:input)
end

post('/input') do
  word_name = params.fetch('word_name')
  definition = params.fetch('definition')
  word = Word.new({:name => word_name, :definitions => [definition]})
  word.save
  @words = Word.all
  erb(:input)
end

get('/word/:id') do
  @id = params[:id].to_i
  @word = Word.find(@id)
  @name = @word.name
  @definitions = @word.definitions
  erb(:word)
end
