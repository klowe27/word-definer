class Word
  @@words = []
  @@current_id = 0

  attr_accessor :name, :id

  def initialize(name)
    @name = name.capitalize
    @id = @@current_id
  end

  def self.all
    @@words
  end

  def self.id
    @@current_id
  end

  def self.clear
    @@words = []
    @@current_id = 0
  end

  def self.find(id)
    @@words.each do |word|
      if word.id == id
        return word
      end
    end
  end

  def self.delete(id)
    word_to_delete = Word.find(id)
    @@words.reject! {|word| word == word_to_delete}
  end

  def save
    @@words.push(self)
      @@current_id += 1
  end

  def update(input_word)
    self.name = input_word.capitalize
  end

end
