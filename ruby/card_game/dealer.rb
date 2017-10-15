require_relative './deck'

module CardGame
  class Dealer
    attr_accessor :deck

    def initialize(total_decks = 1)
      valid_deck = total_decks.is_a?(Integer) && total_decks > 0
      raise ArgumentError, "Dealer needs at least 1 deck" unless valid_deck
            
      decks = []
      total_decks.times { decks << Deck.new }
      @deck = decks.reduce(:+)  
    end

    def shuffle
      @deck.shuffle
    end

    # raises an @OutOfCardsError if you ask for more cards than remain in the deck
    def deal!(cards = 1)
      dealt = @deck.take(cards)
      raise OutOfCardsError if dealt.size < cards
      
      dealt
    end
  end

  class OutOfCardsError < StandardError
  end
end
  