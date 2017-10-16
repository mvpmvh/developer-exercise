# a Blackjack::Player is a CardGame::Player because he has a name and has CardGame::Hand(s)
# But a Blackjack::Player must also have behaviors to play the game of blackjack with a Blackjack::Strategy

require_relative 'plays_blackjack'
require_relative 'strategies/naive'

module Blackjack
  class Player < CardGame::Player
    include PlaysBlackjack

    attr_accessor :strategy

    def initialize(name, strategy = Strategies::Naive)
      super(name)
      @strategy = strategy
    end

    def play_hand!(dealer)
      done = false
      until done do
        # TODO: future player strategies may not care about dealer's exposed card
        move = @strategy.play(self.hand_value, dealer.exposed_card.name)
        cards = dealer.deal!
        self.add_to_hand(cards.first) if move == :hit
        done = true if move == :stay || self.busts?
      end
    end
  end
end
