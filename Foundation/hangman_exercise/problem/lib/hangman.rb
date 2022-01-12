class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  ends

  def initialize
    @secret_word = Hangman.random
    @guess_word = Array.new(@secret_word.length, "_")
  end



end
