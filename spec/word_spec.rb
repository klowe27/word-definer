require('pry')
require('rspec')
require('word')

describe('Word') do
  before()do
    Word.clear
  end

  describe('#initialize') do
    it('will create a new instance of the Word class') do
      word = Word.new({:name => "intelligent", :definitions => ["Someone who is smart."]})
      expect(word.name).to(eq("Intelligent"))
      expect(word.definitions).to(eq(["Someone who is smart."]))
      expect(word.id).to(eq(0))
    end
  end

  describe('#save') do
    it('will save a word to the words array and update current ID') do
      word = Word.new({:name => "intelligent", :definitions => ["Someone who is smart."]})
      word.save
      word2 = Word.new({:name => "banana", :definitions => ["A gross piece of fruit."]})
      word2.save
      expect(Word.all).to(eq([word, word2]))
      expect(word2.id).to(eq(1))
    end
  end

  describe('.clear') do
    it('clear the words array and set current ID to 0') do
      word = Word.new({:name => "intelligent", :definitions => ["Someone who is smart."]})
      word.save
      Word.clear
      expect(Word.all).to(eq([]))
      expect(Word.id).to(eq(0))
    end
  end

  describe('.find') do
    it('find a word based on id') do
      word = Word.new({:name => "intelligent", :definitions => ["Someone who is smart."]})
      word.save
      expect(Word.find(0)).to(eq(word))
    end
  end

  describe('#delete') do
    it('delete a word based on the id') do
      word = Word.new({:name => "intelligent", :definitions => ["Someone who is smart."]})
      word.save
      word2 = Word.new({:name => "banana", :definitions => ["A gross piece of fruit."]})
      word2.save
      word.delete
      expect(Word.all).to(eq([word2]))
    end
  end

  describe('#update') do
    it('update a word\'s name based on an input') do
      word = Word.new({:name => "intelligent", :definitions => ["Someone who is smart."]})
      word.save
      word.update("smart")
      expect(word.name).to(eq("Smart"))
    end
  end

  describe('#add_definition') do
    it('will add a definition to the word') do
      word = Word.new({:name => "intelligent", :definitions => ["Someone who is smart."]})
      word.add_definition("someone who talks a lot.")
      expect(word.definitions).to(eq(["Someone who is smart.", "Someone who talks a lot."]))
    end
  end

  describe('.sort') do
    it('will sort the words in alphabetical order') do
      word = Word.new({:name => "intelligent", :definitions => ["Someone who is smart."]})
      word.save
      word2 = Word.new({:name => "banana", :definitions => ["A gross piece of fruit."]})
      word2.save
      expect(Word.sort).to(eq([word2, word]))
    end
  end

end
