# a Blackjack::Dealer is a CardGame::Dealer because he has a CardGame::Deck
# But a Blackjack::Dealer must also have behaviors to play the game of blackjack with a Blackjack::Strategy

require_relative 'plays_blackjack'
require_relative 'strategies/dealer'

module Blackjack
  class Dealer < CardGame::Dealer
    include Blackjack::PlaysBlackjack

    def initialize(total_decks = 1, strategy = Strategies::Dealer)
      super(total_decks)
      @hand = CardGame::Hand.new
      @strategy = strategy
    end
  end
end