require_relative '../deck'
require_relative '../player'
require_relative './dealer'

class Blackjack
  attr_accessor :players, :dealer

  def initialize(total_players = 1, total_decks = 1)
    valid_players = total_players.is_a?(Integer) && (1..6).include?(total_players)
    raise ArgumentError, "Players must be an integer between 1 and 6" unless valid_players

    valid_decks = total_decks.is_a?(Integer) && (1..8).include?(total_decks)
    raise ArgumentError, "Decks must be an integer between 1 and 8" unless valid_decks

    @dealer = Blackjack::Dealer.new(total_decks)

    setup_players(total_players)
  end

  def play
    # dealer deals 2 cards to each player
    @players.each { |player| player.add_to_hand(@dealer.deal(2)) }

    # dealer deals 2 cards to self
    @dealer.add_to_hand(@dealer.deal(2))
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

  private

  def setup_players(total_players)
    @players = []
    total_players.times { @players << CardGame::Player.new }
  end
end