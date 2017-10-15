# this module provides basic features which would allow a player of the game of blackjack to play rounds of the game
# including: knowing if your hand has blackjack and knowing if you've busted

module Blackjack
  module PlaysBlackjack
    include CardGame::HasHands
    
    def has_blackjack?
      return false unless @hand.size == 2
      return false unless @hand.cards.any? { |card| card.name == :ace }
      return false unless @hand.cards.any? { |card| card.value == 10 }
      true
    end

    def busts?
      blackjack_value > 21
    end

    # returns the maximum blackjack value less than 21 (if possible)
    def blackjack_value
      split = @hand.cards.partition { |card| card.name == :ace }
      aces = split.pop
      value = split
                .pop
                .map { |card| card.value }
                .reduce(:+)
      aces.size.times { value = value + 11 }
      aces.size.times { value = value - 10 if value > 21 }
      value
    end
  end
end