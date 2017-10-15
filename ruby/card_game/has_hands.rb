require_relative './hand'

module CardGame
  module HasHands    
    def hand
      @hand ||= Hand.new
    end

    def add_to_hand(*cards)
      @hand.add_cards(*cards)
    end
  end
end