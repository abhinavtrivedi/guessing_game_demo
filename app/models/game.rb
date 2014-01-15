class Game
  # To change this template use File | Settings | File Templates.
  attr_accessor :secret, :guess, :no_of_tries, :clue

  def initialize
    @secret= rand 1..20
  end

  def guessed?
    @guess == @secret
  end

end