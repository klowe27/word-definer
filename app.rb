require('pry')
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')

get('/') do
  @words = Word.all
  @error = "display:none"
  erb(:input)
end

post('/input') do
  word_name = params.fetch('word_name')
  @error = "display:none"
  if Word.exist?(word_name)
    @error = "display:block"
  else
    word = Word.new({:name => word_name, :definitions => []})
    word.save
  end
  @words = Word.all
  erb(:input)
end

get('/sort')do
  @words = Word.sort
  @error = "display:none"
  erb(:input)
end

get('/reset')do
  @words = Word.all
  @error = "display:none"
  erb(:input)
end

get('/word/:id') do
  @id = params[:id].to_i
  @word = Word.find(@id)
  @name = @word.name
  @definitions = @word.definitions
  erb(:word)
end

get('/random_word') do
  @word = Word.random
  @name = @word.name
  @id = @word.id
  @definitions = @word.definitions
  erb(:word)
end

get('/delete/:id') do
  @id = params[:id].to_i
  @word = Word.find(@id)
  @word.delete
  @words = Word.all
  @error = "display:none"
  erb(:input)
end

post('/definition/:id') do
  @id = params[:id].to_i
  definition = params.fetch('definition')
  @word = Word.find(@id)
  @name = @word.name
  @definitions = @word.definitions
  @word.add_definition(definition)
  @words = Word.all
  erb(:word)
end

get('/all') do
  @words = Word.all
  erb(:words)
end
