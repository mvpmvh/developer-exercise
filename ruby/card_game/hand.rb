
module CardGame
  class Hand
    attr_accessor :cards
  
    def initialize(*cards)
      @cards = cards
    end

    def empty?
      @cards.empty?
    end

    def size
      @cards.size
    end

    def add_cards(*cards)
      @cards = @cards + cards
    end
  end
end
  