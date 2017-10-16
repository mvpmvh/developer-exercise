require_relative '../../card'

module Blackjack
  module Strategies
    module Naive
      def self.play(hand_value, dealer_exposed_card)
        return :stay if hand_value > 15
        # return :stay unless [
        #   CardGame::Card::NAME_VALUES[:ten], 
        #   CardGame::Card::NAME_VALUES[:jack], 
        #   CardGame::Card::NAME_VALUES[:queen], 
        #   CardGame::Card::NAME_VALUES[:king],
        #   CardGame::Card::NAME_VALUES[:ace]
        # ].include?(dealer_exposed_card.name)
        :hit
      end
    end
  end
end

