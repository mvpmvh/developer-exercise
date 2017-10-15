require_relative './card'

module CardGame
  class Deck
    attr_accessor :cards
    
    def initialize
      @cards = []
      Card::SUITS.each do |suit|
        Card::NAME_VALUES.keys.each do |name|
          @cards << Card.new(suit, name)
        end
      end
    end
  
    def shuffle
      @cards.shuffle!
    end

    def take(count = 1)
      @cards.pop(count)
    end

    def empty?
      @cards.empty?
    end

    def size
      @cards.size
    end

    def +(other)
      combined = Deck.new
      combined.cards.clear
      combined.cards = self.cards + other.cards
      combined
    end
  end
end