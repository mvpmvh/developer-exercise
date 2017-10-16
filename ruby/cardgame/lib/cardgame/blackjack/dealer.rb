# a Blackjack::Dealer is a CardGame::Dealer because he has a CardGame::Deck
# But a Blackjack::Dealer must also have behaviors to play the game of blackjack with a Blackjack::Strategy

require_relative 'plays_blackjack'
require_relative 'strategies/dealer'

module Blackjack
  class Dealer < CardGame::Dealer
    include Blackjack::PlaysBlackjack

    attr_accessor :exposed_card

    def initialize(total_decks = 1, strategy = Strategies::Dealer)
      super(total_decks)
      @hand = CardGame::Hand.new
      @strategy = strategy
      @exposed_card = nil
    end

    def expose_card
      @exposed_card = @hand.cards.first
    end

    def play_hand!
      done = false
      until done do
        move = @strategy.play(self.hand_value)
        cards = self.deal!
        self.add_to_hand(cards.first) if move == :hit
        done = true if move == :stay || self.busts?
      end
    end
  end
end