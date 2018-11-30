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

  def save
    @@words.push(self)
      @@current_id += 1
  end

end
