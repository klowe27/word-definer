require('pry')
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')

get('/') do
  @words = Word.all
  @error = "display:none"
  @reset = "display:none"
  @sort = "display:block"
  if Word.all == []
    @list = "display:none"
  else
    @list = "display:block"
  end
  erb(:input)
end

post('/input') do
  word_name = params.fetch('word_name')
  @error = "display:none"
  @reset = "display:none"
  @sort = "display:block"
  if Word.exist?(word_name)
    @error = "display:block"
  else
    word = Word.new({:name => word_name, :definitions => []})
    word.save
  end
  @words = Word.all
  @list = "display:block"
  if Word.all == []
    @list = "display:none"
  end
  erb(:input)
end

get('/sort')do
  @words = Word.sort
  @error = "display:none"
  @list = "display:block"
  @reset = "display:block"
  @sort = "display:none"
  erb(:input)
end

get('/reset')do
  @words = Word.all
  @error = "display:none"
  @list = "display:block"
  @sort = "display:block"
  @reset = "display:none"
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

post('/delete') do
  @id = params.fetch('id').to_i
  @word = Word.find(@id)
  @word.delete
  @words = Word.all
  @error = "display:none"
  @sort = "display:block"
  @reset = "display:none"
  if Word.all == []
    @list = "display:none"
  else
    @list = "display:block"
  end
  erb(:input)
end

post('/definition') do
  @id = params.fetch('id').to_i
  definition = params.fetch('definition')
  @word = Word.find(@id)
  @name = @word.name
  @word.add_definition(definition)
  @definitions = @word.definitions
  @words = Word.all
  erb(:word)
end

get('/all') do
  @sort = "display:block"
  @reset = "display:none"
  @words = Word.all
  erb(:words)
end

get('/sort_all')do
  @sort = "display:none"
  @reset = "display:block"
  @words = Word.sort
  erb(:words)
end

get('/reset_all')do
  @sort = "display:block"
  @reset = "display:none"
  @words = Word.all
  erb(:words)
end
