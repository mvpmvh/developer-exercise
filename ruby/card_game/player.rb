require_relative './has_hands'

module CardGame
  class Player
    include HasHands

    def initialize(hand = Hand.new)
      @hand = hand
    end
  end
end