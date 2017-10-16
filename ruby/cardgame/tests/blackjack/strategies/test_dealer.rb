require 'test_helper'

module Blackjack
  module Strategies
    class TestDealer < Minitest::Test
      def setup
        @strategy = Strategies::Dealer
      end
    
      def test_dealer_strategy_stays_when_hand_value_greater_than_16
        (17..21).each do |value|
          assert_equal :stay, @strategy.play(value)
        end
      end

      def test_dealer_strategy_hits_when_hand_value_less_than_17
        (1..16).each do |value|
          assert_equal :hit, @strategy.play(value)
        end
      end
    end
  end
end
  