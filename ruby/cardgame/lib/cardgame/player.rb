
module CardGame
  class Player
    include HasHands
  
    attr_accessor :name
  
    def initialize(name, hand = Hand.new)
      @hand = hand
      @name = name
    end
  
    def to_s
      "Player: #{name}"
    end
  end
end