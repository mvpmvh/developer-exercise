require_relative '../../card'

module Blackjack
  module Strategies
    module Naive
      def self.play(hand_value, dealer_exposed_card)
        return :stay if hand_value > 15
        return :stay unless CardGame::Card::NAME_VALUES.keys.include?(dealer_exposed_card)
        :hit
      end
    end
  end
end

