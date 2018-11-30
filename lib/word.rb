class Word
  @@words = []
  @@current_id = 0

  attr_accessor :name, :definitions
  attr_reader :id

  def initialize(attributes)
    @name = attributes.fetch(:name).capitalize
    @definitions = attributes.fetch(:definitions)
    @id = @@current_id
  end

  def self.all
    @@words
  end

  def self.id
    @@current_id
  end

  def self.sort
    @@words.sort_by { |word| word.name }
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

  def self.exist?(new_word)
    @@words.each do |word|
      if word.name == new_word.capitalize
        return true
      end
    end
    return false
  end

  def self.random
    @@words.sample
  end

  def delete
    @@words.reject! {|word| word == self}
  end

  def save
    @@words.push(self)
      @@current_id += 1
  end

  def update(input_word)
    self.name = input_word.capitalize
  end

  def add_definition(new_definition)
    self.definitions.push(new_definition.capitalize)
  end

end
