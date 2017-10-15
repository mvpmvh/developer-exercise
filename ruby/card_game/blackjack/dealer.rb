require_relative '../dealer'
require_relative './blackjack_logic'

module Blackjack
  class Dealer < CardGame::Dealer
    include BlackjackLogic

    def initialize(hand = CardGame::Hand.new)
      @hand = hand
    end
  end
end