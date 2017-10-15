class Card
    SUITS = [:hearts, :diamonds, :spades, :clubs]
  
    NAME_VALUES = {
      :two   => 2,
      :three => 3,
      :four  => 4,
      :five  => 5,
      :six   => 6,
      :seven => 7,
      :eight => 8,
      :nine  => 9,
      :ten   => 10,
      :jack  => 10,
      :queen => 10,
      :king  => 10,
      :ace   => [11, 1]
    }
  
    attr_accessor :suit, :name, :value
  
    def initialize(suit, name)
      raise ArgumentError, "Unknown suit '#{suit}'" unless SUITS.include?(suit)
      raise ArgumentError, "Unknown name '#{name}'" unless NAME_VALUES.keys.include?(name)
  
      @suit = suit
      @name = name
      @value = NAME_VALUES[name]
    end
  end