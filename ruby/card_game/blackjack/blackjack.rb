require './deck'
require './dealer'
require './player'

class Blackjack
  attr_accessor :players, :dealer

  def initialize(players=1, decks=1)
    valid_players = players.is_a?(Integer) && (1..6).include?(players)
    raise ArgumentError, "Players must be an integer between 1 and 6" unless valid_players

    valid_decks = decks.is_a?(Integer) && (1..8).include?(decks)
    raise ArgumentError, "Decks must be an integer between 1 and 8" unless valid_decks

    @players = players
    @dealer = Dealer.new
  end

  def play
    # dealer deals 2 cards to each player
    @players.each { |player| player.add_to_hand(@dealer.deal(2)) }

    # dealer deals 2 cards to self
    # dealer exposes 1 of his cards to all players
    # if dealer is showing 10 - A
      # if dealer has blackjack
        # dealer wins
    # players hit until blackjack, 21, bust, or stay
    # dealer hits until at least 17
    # if all players bust, dealer wins
    # if players score > dealer && score <= 21, player wins
    # if player has A, split
      
  end
end