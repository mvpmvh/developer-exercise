require_relative '../has_hands'

module BlackjackLogic
  include CardGame::HasHands
  
  def has_blackjack?
    return false unless @hand.size == 2
    return false unless @hand.cards.any? { |card| card.name == :ace }
    return false unless @hand.cards.any? { |card| card.value == 10 }
    true
  end
end