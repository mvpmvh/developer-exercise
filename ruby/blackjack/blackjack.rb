require './deck'

class Blackjack
  def initialize(players=1)
    valid_arguments = players.is_a?(Integer) && (1..6).include?(players)
    raise ArgumentError, "Players must be an integer between 1 and 6" unless valid_arguments

    @players = players
  end
end