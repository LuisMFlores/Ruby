require "byebug"

class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    indices = []
    @secret_word.each_char.with_index {|el, idx| indices << idx if el == char }
    indices
  end

  def fill_indices(char, indices)
    indices.each { |idx| @guess_word[idx] = char }
  end

  def try_guess(char)
    if already_attempted?(char)
      print("that has already been attempted")
      return false
    else
      @attempted_chars << char
    indices = get_matching_indices(char)
    if indices.empty?
        @remaining_incorrect_guesses -= 1
      else
        fill_indices(char, indices)
      end
      return true
    end
  end

  def ask_user_for_guess
    print "Enter a char: "
    try_guess(gets.chomp)
  end

  def win?
    if @guess_word.join == @secret_word
      print("WIN")
      return true
    end
    false
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      print "LOSE"
      return true
    end
    false
  end

  def game_over?
    if win? || lose?
      print(@secret_word)
      return true
    end
    false
  end

end
