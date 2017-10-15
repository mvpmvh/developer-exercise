# this module can be included in any card game where a player has a hand of cards
# (e.g. both a player and dealer in a game of blackjack) and may need to add cards to his hand

module CardGame
  module HasHands    
    def hand
      @hand
    end
  
    def add_to_hand(*cards)
      @hand.add_cards(*cards)
    end
  end
end