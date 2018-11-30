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
    it('will save a word to the words array') do
      word = Word.new("intelligent")
      word.save
      expect(Word.word_list).to(eq([word]))
    end
  end
end
