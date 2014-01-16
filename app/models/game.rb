class Game
  # To change this template use File | Settings | File Templates.
  attr_accessor :secret, :guess, :no_of_tries, :clue

  def initialize
    @secret= rand 1..20
    @no_of_tries = 0
  end

  def won?
    @guess.to_i == @secret
  end

  def lost?
    @no_of_tries >= 5 && @guess.to_i != @secret
  end

  def is_guess_valid?(number)
    number.is_a? (Integer) && number.to_i >= 1 && number.to_i <= 20
  end

end