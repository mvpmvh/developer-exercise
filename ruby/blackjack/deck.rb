require './card'

class Deck
    attr_accessor :playable_cards
    
    def initialize
      @playable_cards = []
      Card::SUITS.each do |suit|
        Card::NAME_VALUES.keys.each do |name|
          @playable_cards << Card.new(suit, name)
        end
      end
    end
  
    def shuffle
      @playable_cards.shuffle!
    end
  
    def deal_card
      @playable_cards.pop
    end
  end