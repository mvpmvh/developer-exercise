module Blackjack
  module Strategies
    module Dealer
      def self.play(hand_value)
        return :stay if hand_value > 16
        :hit
      end
    end
  end
end
