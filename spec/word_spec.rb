require('pry')
require('rspec')
require('word')

describe('Word') do
  describe('#initialize') do
    it('will create a new instance of the Word class') do
      word = Word.new("intelligent")
      expect(word.name).to(eq("Intelligent"))
      expect(word.id).to(eq(0))
    end
  end

  describe('#save') do
    it('will save a word to the words array and update current ID') do
      word = Word.new("intelligent")
      word.save
      word2 = Word.new("banana")
      word2.save
      expect(Word.words).to(eq([word, word2]))
      expect(word2.id).to(eq(1))
    end
  end
end
