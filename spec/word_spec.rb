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
end
