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
  end
end
