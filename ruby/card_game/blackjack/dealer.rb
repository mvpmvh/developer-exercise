require_relative '../dealer'
require_relative '../has_hands'

module Blackjack
  class Dealer < CardGame::Dealer
    include CardGame::HasHands

    def initialize(hand = CardGame::Hand.new)
      @hand = hand
    end
  end
end